# Copyright (C) 2019 The LineageOS Project
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

# -----------------------------------------------------------------
# TWRP image

TWRP_IMAGE := $(PRODUCT_OUT)/twrp-3.3.1-$(TW_DEVICE_VERSION)-$(LINEAGE_BUILD).img

.PHONY: twrpimage
twrpimage: recoveryimage
	$(hide) ln -f $(PRODUCT_OUT)/recovery.img $(TWRP_IMAGE)
	@echo "Image Complete: $(TWRP_IMAGE)" >&2
