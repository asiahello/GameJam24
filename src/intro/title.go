components {
  id: "title"
  component: "/src/intro/title.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"title\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/src/intro/gui.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 0.5
    y: 0.5
  }
}
