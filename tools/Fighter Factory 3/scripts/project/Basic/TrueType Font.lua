
function template(project)
  local dlg = Wizard()
  dlg.windowText = translate("TrueType Font")

  --  Page 1 --

  local page1 = WizardPage()
  page1.title = dlg.windowText
  page1.subTitle = translate("Enter you name here")
  dlg:addPage(page1)

  local lay = VBoxLayout(page1)

  lay:addWidget(Label(translate("Author:"), page1))
  local author = LineEdit(page1)
  author.text = translate("My name")
  lay:addWidget(author)

  --  Page 2 --

  local page2 = WizardPage()
  page2.title = dlg.windowText
  page2.subTitle = translate("Enter the font information here")
  dlg:addPage(page2)

  local lay2 = VBoxLayout(page2)

  lay2:addWidget(Label(translate("Name:"), page2))
  local name = LineEdit(page2)
  name.text = translate("Font name")
  lay2:addWidget(name)

  lay2:addWidget(Label(translate("File name:"), page2))
  local file = LineEdit(page2)
  file.text = translate("font.ttf")
  lay2:addWidget(file)

  --  Page 3 --

  local page3 = WizardPage()
  page3.title = dlg.windowText
  page3.subTitle = translate("Enter you name here")
  dlg:addPage(page3)

  local lay3 = VBoxLayout(page3)

  lay3:addWidget(Label(translate("Size (in pixels):"), page3))
  local size = IntEdit(page3)
  size.value = 15
  lay3:addWidget(size)

  local blend = CheckBox(translate("Blended"), page3)
  blend.checked = true
  lay3:addWidget(blend)

  --  Generate template --

  if dlg:exec() > 0 then
    local text = [==[
[FNT v2]
fntversion = 2,00
name = "@name"
author = "@author"

[Def]
type = truetype
size = @size,0
spacing = 1,1
offset = 0,0
file = @file
blend = @blend]==]
    local b = "0"
    if blend.checked then
      b = "1"
    end
    text = text:gsub("@name", name.text):gsub("@file", file.text):gsub("@author", author.text)
    text = text:gsub("@size", tostring(size.value)):gsub("@blend", b)

    project.definitions:insertText(text)

    return true
  end

  return false
end
