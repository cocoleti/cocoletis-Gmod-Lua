AddCSLuaFile ()

SWEP.Category = "cocoletis SWEPS"
SWEP.Author = "cocoleti"
SWEP.PrintName = "CrossBoom"
SWEP.Instructions = "Left click to shoot"

SWEP.ViewModel = "models/weapons/v_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.HoldType = "crossbow"

SWEP.Weight = 5
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.Slot = 4
SWEP.SlotPos = 98

SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 15
SWEP.Primary.Ammo = "XBowBolt"
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 1000
SWEP.Primary.NumShots = 4
SWEP.Primary.Spread = 0.15
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 2.0

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false

local ShootSound = Sound ("Weapon_Crossbow.BoltElectrify")

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
Bullet.Tracer = 1
Bullet.Damage = self.Primary.Damage
Bullet.AmmoType = self.Primary.Ammo

self:FireBullets ( Bullet )
self:ShootEffects ()

self:EmitSound ( ShootSound )
self:TakePrimaryAmmo ( 1 )
self:SetNextPrimaryFire ( CurTime () + self.Primary.Delay  )
ply:LagCompensation ( false )
end

function SWEP:SecondaryAttack()
if(Zoom == 0) then

    if(SERVER) then
        self.Owner:SetFOV( 45, 0 )
    end    

    Zoom = 1

else if(Zoom == 1) then

    if(SERVER) then
        self.Owner:SetFOV( 25, 0 )
    end    

    Zoom = 2

else

    if(SERVER) then
        self.Owner:SetFOV( 0, 0 )
    end        

    Zoom = 0

end
end

end

function SWEP:Holster()
self.Owner:SetFOV( 0, 0 )
ScopeLevel = 0

return true

end