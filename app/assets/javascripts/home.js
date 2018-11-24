var ColorGrid = ColorGrid || {};

ColorGrid.Palette = {
  palettes: [],

  init: function(data){
    ColorGrid.Palette.palettes = JSON.parse(data);

    var parentContainer = $(".color-grid-container").find("section");
    parentContainer.html("");
    
    // draw the grids    
    for(var row = 0 ; row < 20; row++) {
      var gridContainer = $("<ul class='grid-items'></ul>");
      for(var col = 0 ; col < 20; col++) {
        var grid = ColorGrid.Palette.getGrid(row, col);
        gridContainer.append(ColorGrid.Palette.renderGrid(row, col, grid));      
      }
      parentContainer.append(gridContainer);  
    }
  },

  renderGrid: function(row, column, grid) {
    return JST['templates/grid']({
      row: row,
      column: column, 
      grid: grid
    });
  },

  getGrid: function(row, column) {
    return ColorGrid.Palette.palettes.find(function(obj) { return obj.row == row && obj.column == column });
  }
}

$(document).ready(function(){
  $(document).on("click", ".grid", function() {
    $(".grid").removeClass("selected");
    $(this).addClass("selected");
  });

  $(".color").minicolors({
    change: function(value, opacity) {
      $(".grid.selected").css("background-color", value);
    }
  });

  $(".create-palette-form").submit(function(e) {
    e.preventDefault();
    var selectedGrid = $(".grid.selected");
    
    if(selectedGrid.length == 0){
      alert("Select a Grid");
    } else {
      var url = $(this).attr("action");
      var color = $(this).find(".color").val();
      var data = {
        color: color,
        row: selectedGrid.data("row"),
        col: selectedGrid.data("column")
      }

      $.post(url, { palette: data });  
    }
    return false;
  });
});
