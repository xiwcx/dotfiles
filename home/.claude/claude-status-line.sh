#!/usr/bin/env bash
input=$(cat)

# ANSI color codes
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
CYAN="\033[36m"
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
MAGENTA="\033[35m"
SEP="${DIM} | ${RESET}"

model=$(echo "$input" | jq -r '.model.display_name // "Unknown model"')

used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

# Rate limits (Claude.ai subscription only)
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Vim mode
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')

# Build context usage segment — green < 50%, yellow 50–79%, red >= 80%
ctx_seg=""
if [ -n "$used_pct" ]; then
  used_int=$(printf "%.0f" "$used_pct")
  if [ "$used_int" -ge 80 ]; then
    ctx_color="${RED}"
  elif [ "$used_int" -ge 50 ]; then
    ctx_color="${YELLOW}"
  else
    ctx_color="${GREEN}"
  fi
  ctx_seg=$(printf "${ctx_color}ctx:%.0f%%${RESET}" "$used_pct")
else
  ctx_seg=$(printf "${DIM}ctx:--${RESET}")
fi

# Build token tally segment — muted/dim
total_tokens=$((total_in + total_out))
if [ "$total_tokens" -gt 0 ]; then
  if [ "$total_tokens" -ge 1000 ]; then
    tok_seg=$(printf "${DIM}tok:%dk${RESET}" "$((total_tokens / 1000))")
  else
    tok_seg=$(printf "${DIM}tok:%d${RESET}" "$total_tokens")
  fi
else
  tok_seg=$(printf "${DIM}tok:--${RESET}")
fi

# Build rate limit segment — dim < 50%, yellow >= 50%, red >= 80%
rate_seg=""
if [ -n "$five_pct" ]; then
  five_int=$(printf "%.0f" "$five_pct")
  if [ "$five_int" -ge 80 ]; then
    r_color="${RED}"
  elif [ "$five_int" -ge 50 ]; then
    r_color="${YELLOW}"
  else
    r_color="${DIM}"
  fi
  rate_seg=$(printf "${SEP}${r_color}5h:%.0f%%${RESET}" "$five_pct")
fi
if [ -n "$week_pct" ]; then
  week_int=$(printf "%.0f" "$week_pct")
  if [ "$week_int" -ge 80 ]; then
    r_color="${RED}"
  elif [ "$week_int" -ge 50 ]; then
    r_color="${YELLOW}"
  else
    r_color="${DIM}"
  fi
  rate_seg="${rate_seg}$(printf " ${r_color}7d:%.0f%%${RESET}" "$week_pct")"
fi

# Build vim mode segment — bold magenta for INSERT, bold yellow for NORMAL
vim_seg=""
if [ -n "$vim_mode" ]; then
  if [ "$vim_mode" = "INSERT" ]; then
    vim_seg="${SEP}${BOLD}${MAGENTA}${vim_mode}${RESET}"
  else
    vim_seg="${SEP}${BOLD}${YELLOW}${vim_mode}${RESET}"
  fi
fi

printf "${CYAN}%s${RESET}${SEP}%s %s%s%s" "$model" "$ctx_seg" "$tok_seg" "$rate_seg" "$vim_seg"
