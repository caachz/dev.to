HTMLDocument.prototype.ready = new Promise(resolve => {
  // creates a promise and waits for it to be resolved and for DOM content to load
  if (document.readyState !== 'loading') {
    return resolve();
  }
  document.addEventListener('DOMContentLoaded', () => resolve());
  return null;
});

document.ready.then(() => {
  if (
    !window.clipboard &&
    !window.Clipboard &&
    !navigator.clipboard &&
    !navigator.Clipboard
  ) {
    import('clipboard-polyfill').then(module => {
      window.clipboard = module;
    });
  }
});
// connects browser clipboard to computer clipboard (???)
// if clipboard doesn't exist, polyfill adds it 

window.WebComponents.waitFor(() => {
  import('@github/clipboard-copy-element');
});
