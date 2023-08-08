document.addEventListener('turbolinks:load', function() {
　const mypageBtnContainer = document.getElementById('mypageBtnContainer');
  const mypageDropdown = document.getElementById('mypageDropdown');

  if (mypageBtnContainer) {
    console.log("if")
    mypageBtnContainer.addEventListener('click', function() {
      console.log('click')
      mypageDropdown.classList.toggle('active');
    });
  }
});