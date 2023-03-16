/**
 * Default config
 * https://github.com/brookhong/Surfingkeys/blob/d96246d3a37abead7899d2b197b7f0dbe050cc95/pages/default.js#L258
 */

function alias(key, target, replace = false) {
  api.map(key, target);
  if (replace) api.unmap(target);
}

function addProvider(key, name, url, ...args) {
  api.addSearchAlias(key, name, url, ...args);
  api.mapkey(`o${key}`, `#8Open Search with alias ${key}`, () =>
    api.Front.openOmnibar({ type: "SearchEngine", extra: key })
  );
}

function scroll(amount = 0) {
  window.scrollTo(0, window.pageYOffset + amount);
}

function mappings() {
  // DEBUG
  api.mapkey("<Backspace>", "#0 debug", () => {
    console.log("api", api);
    console.log("settings", settings);
  });

  // HISTORY
  alias("H", "S", true);
  alias("L", "D", true);

  // SCROLLING
  api.mapkey("<Ctrl-b>", "#2 page up", () =>
    scroll(-1 * 0.9 * window.innerHeight)
  );
  api.mapkey("<Ctrl-f>", "#2 page down", () =>
    scroll(1 * 0.9 * window.innerHeight)
  );
  api.mapkey("<Ctrl-u>", "#2 half page up", () =>
    scroll(-1 * 0.45 * window.innerHeight)
  );
  api.mapkey("<Ctrl-d>", "#2 half page down", () =>
    scroll(1 * 0.45 * window.innerHeight)
  );
}

function unmappings() {
  api.unmap("C");
  api.unmap("d");
  api.unmap("g");
  api.unmap("f");
  api.unmap("/");

  // disable emojis
  api.iunmap(":");
}

function exceptions() {
  api.unmapAllExcept([], /mail.google.com|youtube.com/);
}

(function main() {
  mappings();
  unmappings();
  exceptions();
})();
