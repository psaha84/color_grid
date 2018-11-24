Feature('Color the grid');

Scenario('show 20x20 grid', (I) => {
  I.amOnPage('/');
  I.see('Select the Grid');
  I.seeNumberOfVisibleElements('.grid', 400);
});

Scenario('select and color one grid', async(I) => {
  I.amOnPage('/');
  I.click('.grid');
  I.click('#color');
  I.click('.minicolors-grid');
  I.click('body');
  I.click("Submit");
  I.see("Grid has been successfully updated.");
});

Scenario('Refresh wont create another user', async(I) => {
  I.amOnPage('/');
  const text = await I.grabTextFrom('.username');
  I.refreshPage();
  I.seeTextEquals(text, '.username');
});

Scenario('Leaderboard page will have the username present ', async(I) => {
  I.amOnPage('/');
  const username = await I.grabTextFrom('.username');
  I.click('Leaderboard');
  I.see(username);
});
