module(..., package.seeall)

--;===========================================================
--; LOAD DATA
--;===========================================================
--TODO

--;===========================================================
--; FONTS
--;===========================================================
pmTitle = fontNew('font/JG.fnt')
pmHeader = fontNew('font/font5.fnt')
pmText = fontNew('font/f-6x9.fnt')
pmCma = fontNew('font/f-6x9.fnt')
pmCmaS = fontNew('font/f-6x9.fnt')
pmCmaText = fontNew('font/f-6x9.fnt')

--;===========================================================
--; ANIMATIONS
--;===========================================================
--Cursor
cursorBox = animNew(sysSff, [[
1003,0, 0,0, -1
]])
--animSetTile(cursorBox, 1, 1)
animSetPos(cursorBox, 80, 30)
animSetAlpha(cursorBox, 20, 100)
animUpdate(cursorBox)

--Transparent Background (fade in)
darkenIn = animNew(sysSff, [[
300,1, 0,0, 1, 0, AS256D240
300,1, 0,0, 1, 0, AS256D225
300,1, 0,0, 1, 0, AS256D209
300,1, 0,0, 1, 0, AS256D194
300,1, 0,0, 1, 0, AS256D179
300,1, 0,0, 1, 0, AS256D163
300,1, 0,0, 1, 0, AS256D148
300,1, 0,0, 1, 0, AS256D132
300,1, 0,0, 1, 0, AS256D117
300,1, 0,0, -1, 0, AS256D102
]])
animSetPos(darkenIn, 0, 0)
animSetScale(darkenIn, 320, 240)

--Transparent Background (fade out)
darkenOut = animNew(sysSff, [[
300,1, 0,0, 1, 0, AS256D117
300,1, 0,0, 1, 0, AS256D132
300,1, 0,0, 1, 0, AS256D148
300,1, 0,0, 1, 0, AS256D163
300,1, 0,0, 1, 0, AS256D179
300,1, 0,0, 1, 0, AS256D194
300,1, 0,0, 1, 0, AS256D209
300,1, 0,0, 1, 0, AS256D225
300,1, 0,0, 1, 0, AS256D240
300,1, 0,0, -1, 0, AS256D256
]])
animSetPos(darkenOut, 0, 0)
animSetScale(darkenOut, 320, 240)

--;===========================================================
--; PAUSE MENU
--;===========================================================
t_pauseMain = {
  {id = '', text = 'Resume'},
  --{id = '', text = 'Movelists'},
  --{id = '', text = 'Audio Settings'},
  --{id = '', text = 'Input Settings'},
  {id = '', text = 'Hide Menu'},
  {id = '', text = 'Exit'}
}

--if getGameMode() == 'arcade' then
	--t_pauseMain[#t_pauseMain].text = 'Forfeit Match'
--elseif getGameMode() == 'replay' then
  --for i=2,#t_pauseMain-2 do
    --table.remove(t_pauseMain,2)
  --end
  --t_pauseMain[#t_pauseMain].text = 'Exit Replay'
--elseif getGameMode() == 'training' then
  --table.insert(t_pauseMain,2,{id = '', text = 'Practice Settings'})
  --table.insert(t_pauseMain,3,{id = '', text = 'Playback Settings'})
--end

for i=1, #t_pauseMain do
  t_pauseMain[i].id = createTextImg(pmText, 0, 1, t_pauseMain[i].text, 99.5, (28.5+((240-(50+(13*(#t_pauseMain-1))))/2))+i*13)--, .5, .5, 255, 255)
end
txt_pauseMain = createTextImg(pmTitle, 1, 0, 'Pause', 160, 23+((240-(50+(13*(#t_pauseMain-1))))/2))--,.5,.5,255,255)

pauseMenuActive = false
rectScale = -1
pauseMode = ''
pauseMain = 1
--data.p2In = 2

function f_pauseMain(p, st, esc)
  pn = p
  escape = esc --So the submenus can read it.
  start = st --Ditto.
  if pauseMenuActive == false and rectScale == -1 then
    animReset(darkenIn)
    animUpdate(darkenIn)
    textImgSetBank(txt_pauseMain,pn-1)
    --textImgSetBank(txt_trainCfg,pn-1)
    --textImgSetBank(txt_playbackCfg,pn-1)
    --textImgSetBank(txt_movesMain,pn-1)
    --textImgSetBank(txt_audioCfg,pn-1)
    --textImgSetBank(txt_inputCfg,pn-1)
    --textImgSetBank(txt_keyCfg,pn-1)
    pauseMenuActive = true
    sndPlay(sysSnd, 100, 1)
    rectScale = 0
    --if getGameMode() == "training" then
      --p1RemapOld = getRemapInput(1)
      --p2RemapOld = getRemapInput(2)
    --end
  end
  cmdInput()
  if pauseMode == '' or mainGoTo ~= '' then
    if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and t_pauseMain[#t_pauseMain-1].text == 'Hide Menu' and pauseMain == #t_pauseMain-1 then hide = true end
    if (escape or start or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and (pauseMain == 1 or hide))) and rectScale == 10 then
      sndPlay(sysSnd, 100, 2)
      animReset(darkenOut)
      animUpdate(darkenOut)
      pauseMenuActive = false
      --if getGameMode() == "training" then
        --remapInput(1,p1RemapOld)
        --remapInput(2,p2RemapOld)
      --end
    end
    if pauseMenuActive == true and rectScale < 10 then
      --if rectScale > 0 and getGameMode() == "training" then resetRemapInput() end
      rectScale = rectScale + 1
      animUpdate(darkenIn)
    elseif pauseMenuActive == false and rectScale > 0 then
      rectScale = rectScale - 1
      animUpdate(darkenOut)
    end
    if pauseMenuActive == false and rectScale == 0 then
      togglePauseMenu(0)
      if hide then
       togglePause()
       hide = false
      end
      setSysCtrl(0)
      rectScale = -1
      return
    end
    if pauseMenuActive then
      animDraw(darkenIn)
    else
      animDraw(darkenOut)
    end
    if rectScale ~= 0 then f_drawBorder(85,(240-(50+(13*(#t_pauseMain-1))))/2,nil,nil,pn,rectScale) end
    if rectScale == -1 and mainGoTo ~= '' then
      rectScale = 0
      pauseMode = mainGoTo
      mainGoTo = ''
    end
    if rectScale == 10 then
      setSysCtrl(10)
      if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 2 and commandGetState(p2Cmd, 'u')) then
        sndPlay(sysSnd, 100, 0)
        pauseMain = pauseMain - 1
        if pauseMain < 1 then pauseMain = #t_pauseMain end
      elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 2 and commandGetState(p2Cmd, 'd')) then
        sndPlay(sysSnd, 100, 0)
        pauseMain = pauseMain + 1
        if pauseMain > #t_pauseMain then pauseMain = 1 end
      end
      if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
        if pauseMain == #t_pauseMain then
          exitMatch()
        --elseif getGameMode() == 'training' and pauseMain == 2 then
          --trainCfg = 1
          --sndPlay(sysSnd, 100, 1)
          --mainGoTo = 'practice'
          --rectScale = -10
        --elseif getGameMode() == 'training' and pauseMain == 3 then
          --playbackCfg = 1
          --sndPlay(sysSnd, 100, 1)
          --mainGoTo = 'playback'
          --rectScale = -10
        --elseif (getGameMode() ~= 'training' and pauseMain == 2) or (getGameMode() == 'training' and pauseMain == 4) then
          --movesMain = 1 --Default value in case something goes wrong.
          --for i=1,#t_movesMain do
            --if (player(pn) and displayname() == t_movesMain[i].text) then
              --movesMain = i
              --break
            --end
          --end
          --movesMainPosY = (movesMain-((movesMain-movesMain%2)/2)) <= 10 and (movesMain-((movesMain-movesMain%2)/2)) or 10
          --movesMainOffset = 0
          --sndPlay(sysSnd, 100, 1)
          --mainGoTo = 'movelists'
          --rectScale = -10
        --elseif (getGameMode() ~= 'training' and pauseMain == 3) or (getGameMode() == 'training' and pauseMain == 5) then
          --audioCfg = 1
          --sndPlay(sysSnd, 100, 1)
          --mainGoTo = 'audio'
          --rectScale = -10
        --elseif (getGameMode() ~= 'training' and pauseMain == 4) or (getGameMode() == 'training' and pauseMain == 6) then
          --inputCfg = 1
          --sndPlay(sysSnd, 100, 1)
          --mainGoTo = 'input'
          --rectScale = -10
        end
      end
      textImgDraw(txt_pauseMain)
      for i=1, #t_pauseMain do
        textImgDraw(t_pauseMain[i].id)
      end
      animSetScale(cursorBox, 150,50+(13*(#t_pauseMain-1)))
      animSetWindow(cursorBox, 85,17+((240-(50+(13*(#t_pauseMain-1))))/2)+pauseMain*13, 150,12.5)
      f_dynamicAlpha(cursorBox, 20,100,3, 255,255,0)
      animPosDraw(cursorBox,85,(240-(50+(13*(#t_pauseMain-1))))/2)
    end
  --elseif pauseMode == 'practice' then
    --f_pauseTrain()
  --elseif pauseMode == 'playback' then
    --f_pausePlayback()
  --elseif pauseMode == 'movelists' or pauseMode == 'movelists2' then
    --f_pauseMovelists()
  --elseif pauseMode == 'audio' then
    --f_pauseAudio()
  --elseif pauseMode == 'input' or pauseMode == 'keycfg' or pauseMode == 'padcfg' then
    --f_pauseInput()
  end
end
