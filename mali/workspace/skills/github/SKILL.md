---
name: github
description: GitHub operations via `gh` CLI: issues, PRs, CI runs, code review.
---

# GitHub Skill

ใช้ `gh` CLI สำหรับ GitHub operations

## การใช้งาน

```bash
# List PRs
gh pr list --repo owner/repo

# Check CI status
gh pr checks 55 --repo owner/repo

# Create issue
gh issue create --title "Bug: xxx" --body "Description"

# View status
gh auth status
```

## ติดตั้ง

```bash
# Ubuntu/Debian
apt install gh

# macOS
brew install gh
```

## Authentication

```bash
gh auth login
```
