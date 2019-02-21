# nsorg action

## NS organization on Push

This actions will check the formatting of the project, using
[lein-nsorg](https://github.com/immoh/lein-nsorg/).

## Fixes on Pull Request review

This action provides automated fixes using Pull Request review comments.

If the comment starts with `fix $action_name` or `fix nsorg`, a new commit will
be added to the branch with the automated fixes applied.

**Supports**: autofix on push

## Example workflow

```hcl
workflow "on push" {
  on = "push"
  resolves = ["nsorg"]
}

# Used for fix on review
# Don't enable if you plan using autofix on push
# Or there might be race conditions
workflow "on review" {
  resolves = ["nsorg"]
  on = "pull_request_review"
}

action "nsorg" {
  uses = "m45t3r/actions/nsorg@master"
  # Enable autofix on push
  # args = ["autofix"]
  # Used for pushing changes for `fix` comments on review
  secrets = ["GITHUB_TOKEN"]
}
```

## Credits

This repository is based on
[bltvares/actions](https://github.com/bltavares/actions/tree/master/cljfmt).
