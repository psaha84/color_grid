App.grids = App.cable.subscriptions.create('GridsChannel', {  
  received: function(data) {
    var grid = JSON.parse(data.grid);
    var updatedGrid = $(".grid-items").find("li[data-row='" + grid.row + "'][data-column='" + grid.column + "']");
    updatedGrid.replaceWith(ColorGrid.Palette.renderGrid(grid.row, grid.column, grid));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
