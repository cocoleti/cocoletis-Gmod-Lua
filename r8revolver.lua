AddCSLuaFile()

SWEP.Category = "cocoletis SWEPS"
SWEP.PrintName = "R8 Revolver"
SWEP.Author = "cocoleti"
SWEP.Instructions = "Left click for slow accurate shot. Right click for fast inaccurate shot"

SWEP.ViewModel = "models/weapons/v_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ViewModelFlip = false
SWEP.HoldType = "revolver"
SWEP.UseHands = false

SWEP.Weight = 2
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.Slot = 4
SWEP.SlotPos = 97

SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.AdminSpawnable = true 

SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 6
SWEP.Primary.Ammo = "357"
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 50
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 1.0

SWEP.Secondary.ClipSize = 6
SWEP.Secondary.DefaultClip = 6
SWEP.Secondary.Ammo = "357"
SWEP.Secondary.Automatic = false
SWEP.Secondary.Recoil = 0
SWEP.Secondary.Damage = 50
SWEP.Secondary.NumShots = 1
SWEP.Secondary.Spread = 0.1
SWEP.Secondary.Cone = 0
SWEP.Secondary.Delay = 0.1

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

self:EmitSound ( ShootSound )
self:TakePrimaryAmmo ( 1 )
self:SetNextPrimaryFire ( CurTime () + self.Primary.Delay  )
self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
ply:LagCompensation ( false )
end

function SWEP:SecondaryAttack ()
if ( not self:CanSecondaryAttack () ) then
return
end 

local ply = self:GetOwner ()

ply:LagCompensation ( true )

local Bullet = { }

Bullet.Num = self.Secondary.NumShots
Bullet.Src = ply:GetShootPos ()
Bullet.Dir = ply:GetAimVector()
Bullet.Spread = Vector ( self.Secondary.Spread, self.Secondary.Spread, 0 )
Bullet.Tracer = 0
Bullet.Damage = self.Secondary.Damage
Bullet.AmmoType = self.Secondary.Ammo

self:FireBullets ( Bullet )

self:EmitSound ( ShootSound )
self:TakeSecondaryAmmo ( 1 )
self:SetNextSecondaryFire ( CurTime () + self.Secondary.Delay  )
self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
ply:LagCompensation ( false )
end