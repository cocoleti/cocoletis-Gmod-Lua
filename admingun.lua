AddCSLuaFile()

SWEP.Category = "cocoletis SWEPS"
SWEP.PrintName = "Admin Gun"
SWEP.Author = "cocoleti"
SWEP.Instructions = "Left Click To Unleash Destruction"

SWEP.Weight = 4
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Slot = 4
SWEP.SlotPos = 95
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false
SWEP.DrawCrosshair = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.UseHands = false
SWEP.HoldType = "smg"

SWEP.Primary.ClipSize = 9999
SWEP.Primary.DefaultClip = 9999
SWEP.Primary.Ammo = "none"
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 99999999
SWEP.Primary.NumShots = 50
SWEP.Primary.Spread = 0.1
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"

local ShootSound = Sound ("Weapon_SMG1.Single")

function SWEP:Initialize ()
self:SetWeaponHoldType ( self.HoldType )
end

function SWEP:PrimaryAttack()
if ( not self:CanPrimaryAttack () ) then
return
end 

local ply = self:GetOwner ()

ply:LagCompensation ( true )

local Bullet = { }

Bullet.Num = self.Primary.NumShots
Bullet.Src = ply:GetShootPos ()
Bullet.Dir = ply:GetAimVector()
Bullet.Spread = Vector ( self.Primary.Spread, self.Primary.Spread, 0 )
Bullet.Tracer = 0
Bullet.Damage = self.Primary.Damage
Bullet.AmmoType = self.Primary.Ammo

self:FireBullets ( Bullet )
self:ShootEffects ()

self:EmitSound ( ShootSound )
self:TakePrimaryAmmo ( 0 )
self:SetNextPrimaryFire ( CurTime () + self.Primary.Delay  )
ply:LagCompensation ( false )
end

function SWEP:CanSecondaryAttack()
return false
end