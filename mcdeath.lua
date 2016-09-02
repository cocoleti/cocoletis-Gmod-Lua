AddCSLuaFile()

SWEP.HoldType = "rpg"

SWEP.Category = "cocoletis SWEPS"
SWEP.PrintName = "McDeath"
SWEP.Author = "cocoleti"
SWEP.Instructions = "Left click to fire a McDeathMeal. Right click to fire McDeathMiniMeal."
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Slot = 4
SWEP.SlotPos = 96
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.UseHands = false
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = "models/weapons/v_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"
SWEP.HoldType = "rpg"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 1.0

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Delay = 1.0

local ShootSound = ( "Weapon_SMG1.Special1" )

function SWEP:PrimaryAttack()
self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
if (CLIENT) then return end

local ent = ents.Create( "mcdmeal" )

if (!IsValid( ent ) ) then return end

ent:SetPos( self.Owner:EyePos() + (self.Owner:GetAimVector() * 10) )
ent:SetAngles( self.Owner:EyeAngles() )
ent:Spawn()

local phys = ent:GetPhysicsObject()
if ( !IsValid( phys ) ) then ent:Remove() return end

local velocity = self.Owner:GetAimVector()
velocity = velocity * 100000
velocity = velocity + (VectorRand() * 100)
phys:ApplyForceCenter( velocity )

self:EmitSound ( ShootSound )

cleanup.Add(self.Owner, "props", ent)
 
	undo.Create ("McDeathMeal")
		undo.AddEntity (ent)
		undo.SetPlayer (self.Owner)
	undo.Finish()

end

function SWEP:SecondaryAttack()
self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
if (CLIENT) then return end

local ent = ents.Create( "mcdmeal2" )

if (!IsValid( ent ) ) then return end

ent:SetPos( self.Owner:EyePos() + (self.Owner:GetAimVector() * 10) )
ent:SetAngles( self.Owner:EyeAngles() )
ent:Spawn()

local phys = ent:GetPhysicsObject()
if ( !IsValid( phys ) ) then ent:Remove() return end

local velocity = self.Owner:GetAimVector()
velocity = velocity * 100000
velocity = velocity + (VectorRand() * 100)
phys:ApplyForceCenter( velocity )

self:EmitSound ( ShootSound )

cleanup.Add(self.Owner, "props", ent)
 
	undo.Create ("McDeathMiniMeal")
		undo.AddEntity (ent)
		undo.SetPlayer (self.Owner)
	undo.Finish()

end

function SWEP:Initialize()
self:SetWeaponHoldType ( self.HoldType )
end

function SWEP:Reload()
return false
end