
function template(project)
  local dlg = Wizard()
  dlg.windowTitle = translate("Empty project")

  local page = WizardPage()
  page.title = dlg.windowTitle
  page.subTitle = translate("Choose the type of the new blank project")
  dlg:addPage(page)

  local char = RadioButton(translate("Character"), page)
  local stage = RadioButton(translate("Stage"), page)
  local font = RadioButton(translate("Font"), page)
  local story = RadioButton(translate("Storyboard"), page)

  local lay = VBoxLayout(page)
  lay:addWidget(char)
  lay:addWidget(stage)
  lay:addWidget(font)
  lay:addWidget(story)

  char.checked = true

  local ret = dlg:exec() > 0

  if char.checked then
    project.type = Project.Character
  elseif stage.checked then
    project.type = Project.Stage
  elseif font.checked then
    project.type = Project.Font
  else
    project.type = Project.Storyboard
  end

  return ret
end
