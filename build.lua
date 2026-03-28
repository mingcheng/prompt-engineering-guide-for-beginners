--[==============================================[--
   L3BUILD FILE FOR PROMPT-ENGINEERING-GUIDE
     Check PDF File & Directory After Build
--]==============================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "prompt-engineering-guide-for-beginners"
version          = "2026.3.29"
maintainer       = "mingcheng"
uploader         = maintainer
maintainid       = "mingcheng"
email            = "mingcheng@outlook.com"
repository       = "https://github.com/" .. maintainid .. "/" .. module
announcement     = "Initial release"
note             = ""
summary          = "A beginner-friendly prompt engineering guide written in Chinese"
description      = [[A fully open-source prompt engineering booklet for beginners who want to integrate large language models (LLMs) into their work and daily life. Covers basic concepts, prompt techniques, multimodal prompting, safety and ethics, and practical workflows.]]

--[==========================================[--
         Build, Pack and Upload To CTAN
         Do not Modify Unless Necessary
--]==========================================]--
ctanzip          = module
excludefiles     = {"*~"}
supportdir       = "chapter"
textfiles        = {"*.md", "LICENSE", "*.lua", "makefile", "*.bat"}
typesetexe       = "latexmk"
typesetfiles     = {module .. ".tex"}
typesetopts      = "-xelatex -interaction=nonstopmode"
typesetruns      = 1
typesetsuppfiles = {"*.tex"}

uploadconfig = {
  pkg          = module,
  version      = version,
  author       = maintainer,
  uploader     = uploader,
  email        = email,
  summary      = summary,
  description  = description,
  announcement = announcement,
  note         = note,
  license      = "lppl1.3c",  
  ctanPath     = "/info/" .. module,
  home         = repository,
  support      = repository .. "/issues",
  bugtracker   = repository .. "/issues",
  repository   = repository,
  development  = "https://github.com/" .. maintainid,
  update       = false
}

function docinit_hook()
  local docsuppdir = typesetdir .. "/" .. supportdir
  mkdir(docsuppdir)
  for _,supp in pairs(typesetsuppfiles) do
    cp(supp, supportdir, docsuppdir)
    rm(typesetdir, supp)
  end
  cp(module .. ".tex", currentdir, typesetdir)
  return 0
end
function tex(file,dir,cmd)
  dir = dir or "."
  cmd = cmd or typesetexe .. " " .. typesetopts
  return run(dir, cmd .. file)
end
function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)
  for _,main in ipairs({typesetsuppfiles, pdffiles}) do
    for _,glob in pairs(main) do
      cp(glob, typesetdir, pkgdir)
    end
  end
  local pkgsuppdir = ctandir .. "/" .. ctanpkg .. "/" .. supportdir
  mkdir(pkgsuppdir)
  for _,supptab in pairs(typesetsuppfiles) do
    cp(supptab, supportdir, pkgsuppdir)
  end
end