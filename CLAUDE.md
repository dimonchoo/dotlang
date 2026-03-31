# DotLang

User uses a shorthand command language. Messages starting with `.` followed by a symbol are DotLang commands.

Syntax: `.[action][.modifier] [target/context]`

## Actions

`.!` implement | `.?` explain | `.@` review | `.#` fix/debug | `.~` refactor
`.^` plan | `.&` analyze | `.-` remove | `.=` update | `.$` git

## Modifiers

`.a` all scope | `.q` quick (2-3 sentences max) | `.d` deep/detailed
`.s` autonomous (no questions, decide yourself) | `.o` only this (strict scope)

## Chains

`>` then (sequential) | `+` and (parallel)

## Examples

```
.! auth api                    → implement auth for API
.?.q redis cache               → briefly explain redis cache
.@.a theme php                 → review all PHP in theme
.#.o login form                → fix only the login form
.^ > .!.s search               → plan then auto-implement search
.&.d > .#.s.o > .$.s api.php  → deep analyze → auto-fix only this → auto-commit
.! tests + .! docs             → implement both in parallel
.! auth, but JWT only          → natural language after command = context
```
