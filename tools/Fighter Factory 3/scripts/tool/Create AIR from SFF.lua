function main()
  local proj = project()
  local sprites = proj.sprites
  local anims = proj.animations

  if sprites.count > 0 then
    local dlg = ProgressDialog()
    dlg.max = sprites.count
    dlg:show()
    local sprGrps = {}
    for i = 0, sprites.count-1 do
      dlg.value = i
      local spr = sprites:at(i)
      if sprGrps[spr.itemGroup] ~= nil then
        table.insert(sprGrps[spr.itemGroup], spr.itemIndex)
      else
        sprGrps[spr.itemGroup] = { spr.itemIndex }
      end
    end

    for grp, idxs in pairs(sprGrps) do
      local anim = anims:add(grp)
      table.sort(idxs)
      for n, idx in ipairs(idxs) do
        local frame = anim:frameAdd()
        frame.spriteGroup = grp
        frame.spriteIndex = idx
      end
    end
  end
end