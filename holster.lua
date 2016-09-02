AddCSLuaFile()

SWEP.Category = "cocoletis SWEPS"
SWEP.PrintName = "Holster"
SWEP.Instructions = "Just Hold It :)"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"

SWEP.Slot = 4
SWEP.SlotPos = 96
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = true

SWEP.UseHands = false
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = "models/weapons/w_bugbait.mdl"
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.HoldType = "normal"

function SWEP:CanPrimaryAttack()
return false
end

function SWEP:CanSecondaryAttack()
return false 
end

function SWEP:Initialize()
self:SetWeaponHoldType ( self.HoldType )
end

function SWEP:Deploy()
	self.Owner:DrawWorldModel (false)
end

function SWEP:Reload()
return false
end