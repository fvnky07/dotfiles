# Ghostty Terminal Integration for Fish Shell
# NOTE: Ghostty has native OSC 133 semantic zone support, so Fish needs minimal integration

if status is-interactive && test -n "$GHOSTTY_RESOURCES_DIR"
    # Mark the beginning of prompt display with OSC 133;P (prompt)
    function __ghostty_prompt_start --on-event fish_prompt
        printf "\033]133;P;k=i\007"
    end
    
    # Emit command execution marker
    function __ghostty_command_executed --on-variable _
        printf "\033]133;C;\007"
    end
end
