// document has loaded before running other functions
HTMLDocument.prototype.ready = new Promise(resolve => {
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
    // if doesnt exist add it
    import('clipboard-polyfill').then(module => {
      window.clipboard = module;
    });
  }
});
// this attches clipboard from comp to browser

window.WebComponents.waitFor(() => {
  import('@github/clipboard-copy-element');
});
