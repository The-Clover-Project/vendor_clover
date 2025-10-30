#!/usr/bin/env bash
#
# Copyright (C) 2024-2026 The Clover Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Stop script on first error, treat unset variables as an error
set -euo pipefail

# Main Function
main() {
    # Validate arguments
    if [[ "$#" -ne 3 ]]; then
        print_usage
        exit 1
    fi

    # Variable Setup
    local device_codename="$1"
    local product_out_dir="$2"
    local zip_filename="$3"

    # Extract variant (GMS or VANILLA)
    local variant_ext="${zip_filename##*-}"
    local variant="${variant_ext%.*}"
    local variant_lower=$(echo "${variant}" | tr '[:upper:]' '[:lower:]')

    local zip_path="${product_out_dir}/${zip_filename}"
    local build_prop_path="${product_out_dir}/system/build.prop"
    local output_json_path="${product_out_dir}/${device_codename}_${variant_lower}.json"

    # Pre-execution Checks
    check_file_exists "${zip_path}"
    check_file_exists "${build_prop_path}"

    # Main Logic
    printf "Generating Clover OTA JSON for '%s' (Variant: %s)...\n" "${device_codename}" "${variant}"

    # Remove old JSON file if it exists
    rm -f "${output_json_path}"

    # Data Extraction
    printf -- "--> Calculating file properties...\n"
    local timestamp
    timestamp=$(grep "ro.system.build.date.utc" "${build_prop_path}" | cut -d'=' -f2)
    local sha256
    sha256=$(sha256sum "${zip_path}" | cut -d' ' -f1)
    local md5
    md5=$(md5sum "${zip_path}" | cut -d' ' -f1)
    local size
    size=$(stat -c "%s" "${zip_path}")
    local version
    version=$(echo "${zip_filename}" | cut -d'-' -f2 | sed 's/v//')
    local major_version
    major_version=$(echo "${version}" | cut -d'.' -f1)
    local minor_version
    minor_version=$(echo "${version}" | cut -d'.' -f2)
    local url="https://get.thecloverproject.com/folder/${device_codename}/${major_version}.x/${major_version}.${minor_version}/${zip_filename}"

    # JSON File Generation
    printf -- "--> Writing JSON data to %s\n" "${output_json_path}"
    generate_json_output > "${output_json_path}"

    printf "JSON generation complete!\n"
}

# Helper Functions

# Prints the usage instructions for the script.
print_usage() {
    printf "ERROR: Incorrect number of arguments.\n" >&2
    printf "Usage: %s CODENAME PRODUCT_OUT_DIR ZIP_FILENAME\n" "$(basename "$0")" >&2
}

# Checks if a file exists and exits with an error if it doesn't.
#
# $1: Path to the file to check.
check_file_exists() {
    if [[ ! -f "$1" ]]; then
        printf "ERROR: Required file not found at %s\n" "$1" >&2
        exit 1
    fi
}

# Generates the JSON content and prints it to standard output.
generate_json_output() {
    cat <<EOF
{
  "response": [
    {
      "datetime": ${timestamp},
      "filename": "${zip_filename}",
      "id": "${sha256}",
      "md5": "${md5}",
      "size": ${size},
      "url": "${url}",
      "version": "${version}"
    }
  ]
}
EOF
}

# Script Execution
# Call the main function with all script arguments
main "$@"