-- Easily comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  config = function()
    require("Comment").setup() 
  end,
  lazy = false,
}
