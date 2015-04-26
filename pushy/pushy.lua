local MIN_TIMER_DURATION = 0

local PlayerStandard__check_action_interact_original = PlayerStandard._check_action_interact

function PlayerStandard:_check_action_interact(t, input)
    if input.btn_interact_release and self._interact_params then
        if self._interact_params.timer >= MIN_TIMER_DURATION then
            return false
        end
    elseif input.btn_interact_press and self:_interacting() then
        self:_interupt_action_interact()
        return false
    end

    return PlayerStandard__check_action_interact_original(self, t, input)
end
