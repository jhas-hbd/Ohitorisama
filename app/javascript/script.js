document.addEventListener('turbolinks:load', function() {
　const mypageBtnContainer = document.getElementById('mypageBtnContainer');
  const mypageDropdown = document.getElementById('mypageDropdown');

  if (mypageBtnContainer) {
    mypageBtnContainer.addEventListener('click', function() {
      mypageDropdown.classList.toggle('active');
    });
  }
});