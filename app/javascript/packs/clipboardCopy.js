// creates a new promise if the document is loaded completely
HTMLDocument.prototype.ready = new Promise(resolve => {
  if (document.readyState !== 'loading') {
    return resolve();
  }
  // if the DOM content is ready add an event listener
  document.addEventListener('DOMContentLoaded', () => resolve());
  return null;
});
// execute this code if document is ready
document.ready.then(() => {
  // if there is no clipboard on the window or navigator
  if (
    !window.clipboard &&
    !window.Clipboard &&
    !navigator.clipboard &&
    !navigator.Clipboard
  ) {
    // import clipboard-polyfill
    import('clipboard-polyfill').then(module => {
      // assign that module to the clipboard
      window.clipboard = module;
    });
  }
});
// wait for the window web components to load
window.WebComponents.waitFor(() => {
  // import the clipboard elements from github
  import('@github/clipboard-copy-element');
});
