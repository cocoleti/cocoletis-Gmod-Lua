AddCSLuaFile()

SWEP.Category = "cocoletis SWEPS"
SWEP.PrintName = "The High Nooner"
SWEP.Author = "cocoleti"
SWEP.Instructions="Its high noon!!!"
SWEP.ViewModel = "models/weapons/v_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"

SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.HoldType = "pistol"

SWEP.Weight = 1
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.SlotPos = 95
SWEP.Slot = 4

SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 1000000
SWEP.Primary.DefaultClip = 100000000
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Automatic = false
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 9999999
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 2

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false

local ShootSound = Sound ("Weapon_357.Single")

function SWEP:Initialize ()
self:SetWeaponHoldType ( self.HoldType )
end

function SWEP:PrimaryAttack ()
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
self:TakePrimaryAmmo ( 1 )
self:SetNextPrimaryFire ( CurTime () + self.Primary.Delay  )
ply:LagCompensation ( false )
end

function SWEP:CanSecondaryAttack ()
	return false
end

function SWEP:Initialize()
self:SetWeaponHoldType ( self.HoldType )
end