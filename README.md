# Lua Metatable __index and Nil Checks Bug

This repository demonstrates a subtle bug in Lua related to the interaction between metatables' `__index` method and functions that perform nil checks.  The issue arises when a function checks for `nil` before accessing table fields, and the table uses a metatable with a custom `__index` method.

The bug manifests when the `__index` method returns `nil`. Even though the function explicitly checks for `nil`, the access to the non-existent field triggers an error.

## Reproduction Steps

1. Clone this repository.
2. Run `bug.lua`.
3. Observe the unexpected error.

## Solution

The solution involves modifying the function to handle the case where the `__index` method returns `nil` more gracefully.  This often involves checking for `nil` *after* attempting to access the field, or using pcall to safely handle potential errors.