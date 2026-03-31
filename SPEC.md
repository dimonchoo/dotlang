# DotLang — Meta-Language for Human-to-AI Communication

> Compress intent, not meaning. 3 seconds instead of 5 minutes.

**Inspiration:** Emmet (HTML), Vim motions (`d3w`), Unix pipes (`cmd1 | cmd2`)

## Syntax

```
.[action][.modifier] [target]
```

Chains:
```
.[action] > [action]          — sequential (then)
.[action] + [action]          — parallel (and)
.[action] > [action] > [action] — pipeline (3+ steps)
```

## Actions

| Symbol | Action | UK | EN | Mnemonic |
|---|---|---|---|---|
| `.!` | Implement | зроби, створи | create, build, add | **!** = imperative |
| `.?` | Explain | поясни, розкажи | explain, what is | **?** = question |
| `.@` | Review | перевір, подивись | review, check, audit | **@** = look at |
| `.#` | Fix / Debug | виправ, полагодь | fix, debug, investigate | **#** = issue |
| `.~` | Refactor | перепиши, оптимізуй | refactor, simplify, clean up | **~** = transform |
| `.^` | Plan | сплануй, продумай | plan, design, approach | **^** = high-level |
| `.&` | Analyze | проаналізуй, розбери | analyze, explore, research | **&** = connect data |
| `.-` | Remove | видали, прибери | remove, delete, drop | **-** = minus |
| `.=` | Update | зміни, оновлюй | update, change, modify | **=** = bring to |
| `.$` | Git op | закоміть, пуш | commit, push, branch | **$** = shell prompt |

## Modifiers

| Suffix | Meaning | Example |
|---|---|---|
| `.a` | All scope | `.@.a tests` — review ALL tests |
| `.q` | Quick / brief | `.?.q redis` — explain Redis in 2-3 sentences |
| `.d` | Deep / detailed | `.&.d api` — deep analysis of API |
| `.s` | Self / autonomous | `.!.s auth` — implement without asking |
| `.o` | Only this | `.#.o login` — fix ONLY login, nothing else |

## Chain Operators

| Operator | Meaning | Analogy |
|---|---|---|
| `>` | Then (sequential) | Unix pipe: `cmd1 \| cmd2` |
| `+` | And (parallel) | Background: `cmd1 & cmd2` |

## Examples

### Simple commands

| DotLang | Meaning |
|---|---|
| `.! auth api` | Implement auth for API |
| `.?.q redis cache` | Briefly explain Redis cache |
| `.@ header component` | Review header component |
| `.# 401 login` | Fix 401 error on login |
| `.~ api handlers` | Refactor API handlers |
| `.^ search feature` | Plan search feature |
| `.- dead code utils` | Remove dead code from utils |
| `.= config redis timeout` | Update Redis timeout in config |
| `.$` | Commit (auto-message) |

### With modifiers

| DotLang | Meaning |
|---|---|
| `.?.q redis cache` | Quick explain Redis cache (2-3 sentences) |
| `.&.d api performance` | Deep analysis of API performance |
| `.!.s auth middleware` | Implement auth middleware autonomously |
| `.@.a php files` | Review ALL PHP files |
| `.#.o login form` | Fix ONLY the login form |
| `.$.s` | Commit autonomously (pick message yourself) |

### Pipelines

| DotLang | Meaning |
|---|---|
| `.^ > .! search` | Plan then implement search |
| `.@ > .# api` | Review then fix API |
| `.& > .^ > .!.s auth` | Analyze → plan → implement auth autonomously |
| `.! tests + .! docs` | Create tests AND docs in parallel |
| `.!.s > .$.s` | Implement then commit (both autonomous) |
| `.&.d > .?.q` | Analyze deeply then explain briefly |

### Real-world compression

```
BEFORE (voice, ~2 minutes):
"Hey, look at api.php, analyze it in detail,
 if you find problems — fix them yourself,
 don't touch anything else, then commit"

AFTER (DotLang, ~3 seconds):
.&.d > .#.s.o > .$.s api.php
```

## Mixing with natural language

DotLang can be mixed with natural language for context:

```
.!.s auth api, but no OAuth — JWT only
.# login form — users report 500 on submit
.^ migration strategy, we have 200 pages to move
```

## Limitations

- DotLang is for **structured commands**. Questions, discussions, corrections — use natural language.
- Target is always **free text** after the command. No codes needed for targets.
- If Claude doesn't understand — it will ask. The language is tolerant to errors.

## Quick Reference

```
ACTIONS          MODIFIERS        CHAINS
.!  implement    .a  all          >  then
.?  explain      .q  quick        +  and
.@  review       .d  deep
.#  fix          .s  self/auto
.~  refactor     .o  only this
.^  plan
.&  analyze
.-  remove
.=  update
.$  git
```
