-- Throw code generator

function makeThrow(info, binds)

  -- Code snippets

  local StDef = [==[
[Statedef @sdef]
type = S
movetype= A
physics = S
juggle = 0
velset =
anim = @p1anim

[State @sdef, 1]
type = HitDef
trigger1 = Time = 0
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = ifelse (command = "holdfwd", -1, 1)
p2facing = 1
p1stateno = @sdef10
p2stateno = @sdef20
fall = 1

[State @sdef, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
]==]

  local StDef10 = [==[
[Statedef @sdef10]
type = S
movetype= A
physics = N
anim = @p1animstart
poweradd = 60
]==]

  local StDef10_2 = [==[
[State @sdef10, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = @bindcount
value = -78

[State @sdef10, Throw]
type = TargetState
trigger1 = AnimElem = @bindcount
value = @sdef21

[State @sdef10, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
]==]

  local StDef20 = [==[
[Statedef @sdef20]
type = A
movetype = H
physics = N
velset = 0,0

[State @sdef20, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = @p2anim
]==]

  local StDef21 = [==[
[Statedef @sdef21]
type = A
movetype = H
physics = N
velset = @velx,@vely
poweradd = 40

[State @sdef21, 1] ;Gravity
type = VelAdd
trigger1 = 1
y = .4

[State @sdef21, 2] ; Recover near ground (use ChangeState)
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State @sdef21, 3] ; Recover in mid air (use SelfState)
type = SelfState
triggerall = Vel Y > 0
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIRRECOVER

[State @sdef21, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground
]==]

  local SprPriority = [==[
[State @sdef10, SprPriority]
type = SprPriority
trigger1 = AnimElem = @elem
value = @priority
]==]

  local BindElem = [==[
[State @sdef10, Bind @elem]
type = TargetBind
trigger1 = AnimElem = @elem
pos = @x, @y
]==]

  -- Replace and concatenate

  local t = {}
  t[#t+1] = StDef:gsub("@sdef", info.StateDef):gsub("@sdef10", info.StateDef+10):gsub("@sdef20", info.StateDef+20):gsub("@p1anim", info.P1Anim)
  t[#t+1] = StDef10:gsub("@sdef10", info.StateDef+10):gsub("@p1animstart", info.P1AnimStart)

  for i,v in ipairs(binds) do
    if v.SprPriority ~= 0 then
      t[#t+1] = SprPriority:gsub("@sdef10", info.StateDef+10):gsub("@elem", i):gsub("@priority", v.SprPriority)
    end

    t[#t+1] = BindElem:gsub("@sdef10", info.StateDef+10):gsub("@elem", i):gsub("@x", v.X):gsub("@y", v.Y)
  end

  t[#t+1] = StDef10_2:gsub("@sdef10", info.StateDef+10):gsub("@sdef21", info.StateDef+21):gsub("@bindcount", info.BindCount)
  t[#t+1] = StDef20:gsub("@sdef20", info.StateDef+20):gsub("@p2anim", info.P2Anim)
  t[#t+1] = StDef21:gsub("@sdef21", info.StateDef+21):gsub("@velx", info.XVelocity):gsub("@vely", info.YVelocity)

  return table.concat(t, "\n");
end
