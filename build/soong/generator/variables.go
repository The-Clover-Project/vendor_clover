package generator

import (
	"fmt"

	"android/soong/android"
)

func cloverExpandVariables(ctx android.ModuleContext, in string) string {
	cloverVars := ctx.Config().VendorConfig("cloverVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if cloverVars.IsSet(name) {
			return cloverVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
