# DotLang

User uses a shorthand command language. Messages starting with `.` followed by a symbol are DotLang commands. Parse them as:

```
.[action][.modifier] [target/context]
```

## Actions

`.!` implement/create | `.?` explain | `.@` review/check | `.#` fix/debug | `.~` refactor | `.^` plan | `.&` analyze | `.-` remove | `.=` update/modify | `.$` git commit/push

## Modifiers (append to action)

`.a` all scope | `.q` quick/brief | `.d` deep/detailed | `.s` autonomous (do without asking) | `.o` only this (strict scope)

## Chains

`>` then (sequential) | `+` and (parallel)

Example: `.&.d > .#.s.o > .$.s api.php` = analyze deeply → fix autonomously (only this) → commit autonomously for api.php

## Rules

- `.s` modifier: proceed without confirmation, make all decisions yourself
- `.o` modifier: strict scope — do not touch anything outside the target
- `.q` modifier: response max 2-3 sentences
- `.d` modifier: thorough, comprehensive analysis
- Free text after the command is target/context. Natural language can follow: `.! auth api, but JWT only`
- If the command is ambiguous — ask for clarification
