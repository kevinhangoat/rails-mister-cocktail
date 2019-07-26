const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const navbarText = document.querySelectorAll('.btn-black');
  console.log (navbarText)
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
        navbarText.forEach(function(item) {
          item.classList.add('btn-light');
          item.classList.remove('btn-black');
        })
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        navbarText.forEach(function(item) {
          item.classList.add('btn-black');
          item.classList.remove('btn-light');
        })
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
