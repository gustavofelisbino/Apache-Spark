/*
  Scroll-reveal for Material for MkDocs.
  Uses the `document$` observable exposed by the theme so it works
  together with `navigation.instant` (SPA-style page transitions).
*/

(function () {
  function activateReveals() {
    var targets = document.querySelectorAll('.reveal:not(.is-visible)');
    if (!targets.length) return;

    if (!('IntersectionObserver' in window)) {
      targets.forEach(function (el) { el.classList.add('is-visible'); });
      return;
    }

    var io = new IntersectionObserver(function (entries, observer) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });

    targets.forEach(function (el) { io.observe(el); });
  }

  if (typeof document$ !== 'undefined' && document$.subscribe) {
    document$.subscribe(activateReveals);
  } else if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', activateReveals);
  } else {
    activateReveals();
  }
})();
