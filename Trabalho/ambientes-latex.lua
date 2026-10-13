function Div(el)
  -- Ambiente Question numerado
  if el.classes:includes("questao") then
    table.insert(
      el.content, 1,
      pandoc.RawBlock("latex", "\\begin{questao}")
    )
    table.insert(
      el.content,
      pandoc.RawBlock("latex", "\\end{questao}")
    )
    return el.content
  end

  -- Ambiente Solution sem numeração
  if el.classes:includes("solucao") then
    table.insert(
      el.content, 1,
      pandoc.RawBlock("latex", "\\begin{solucao}")
    )
    table.insert(
      el.content,
      pandoc.RawBlock("latex", "\\end{solucao}")
    )
    return el.content
  end
  
  -- Ambiente Partes
  if el.classes:includes("partes") then
    table.insert(
      el.content, 1,
      pandoc.RawBlock("latex", "\\begin{partes}")
      )
    table.insert(
      el.content,
      pandoc.RawBlock("latex", "\\end{partes}"))
    return el.content
  end

  -- Ambiente Subpartes
  if el.classes:includes("subpartes") then
    table.insert(
      el.content, 1,
      pandoc.RawBlock("latex", "\\begin{subpartes}")
      )
    table.insert(
      el.content, 
      pandoc.RawBlock("latex", "\\end{subpartes}"))
    return el.content
  end
end
