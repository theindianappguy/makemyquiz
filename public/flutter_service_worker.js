'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "26490c7d9f22418e3fd16ab86963938e",
"/": "26490c7d9f22418e3fd16ab86963938e",
"main.dart.js": "dac07086f668bde60862ea2bf2c73a29",
"favicon.png": "3e42b5476a69bbe7e1d6edd15b395a8b",
"icons/Icon-192.png": "a4fa8953340085fb6637bcb2d462cb4c",
"icons/Icon-512.png": "b762010504485b7af7d1572caca4efd3",
"manifest.json": "faa99f84bd14735b75826925e6b344e5",
"assets/LICENSE": "722248ae1841930e7027e81a279ebfa8",
"assets/AssetManifest.json": "cf9ad8627a6e78597c1580c2edcf9f7e",
"assets/FontManifest.json": "e8aa4d19e8e636aebc8066611718a76b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/images/info.png": "21593986fce2ebd98788d4dfe41c27ea",
"assets/assets/images/star_hollow.png": "4221d49412a9cf66d521251d03908b7c",
"assets/assets/images/playquiz_illustration.png": "40e47bbad4b24773a0de9a00049a2466",
"assets/assets/images/instagram.png": "1679dd635e0f4af129444c48422ed0ef",
"assets/assets/images/logout.png": "0e6ff6346955b8edf26c15ee89b16c2a",
"assets/assets/images/profilepic.jpg": "74bd61f59771078dd9cc69bd40af385b",
"assets/assets/images/home.png": "9a179009919d39352e0d193836c2b6ae",
"assets/assets/images/github_logo.png": "c30b6daa7877a585d0177191a76fd1ce",
"assets/assets/images/list.png": "331786b3458af0129435e7d9b8ef0de6",
"assets/assets/images/grid.png": "42cb3fb9f7c092dd7995274f15e9db4e",
"assets/assets/images/logo.png": "43adb83f63576aa2dd70f057cd6aeaa2",
"assets/assets/images/nerd.png": "b8ff39dc8eafffe7be2252440ccb2f61",
"assets/assets/images/twitter.png": "4cab7d8527839f485cd1dce1dbc52057",
"assets/assets/images/linkedin.png": "a219375dbf115b4fd65e5e485f58eee0",
"assets/assets/images/share.png": "cbd053fedf63665c3f7bfc352aa62203",
"assets/assets/images/dribble.png": "706e19bf8377e506d3f36c37e6235977",
"assets/assets/images/star.png": "adb1853f1ef5e33c6f820628a33035b4",
"assets/assets/images/facebook.png": "bb84a18110f3053c979267015b647a08",
"assets/assets/images/arrow_down.png": "808a11189a5fd954d5a33fcdf3318d26",
"assets/assets/fonts/overpass_bold.otf": "e6dbbcd2f162fd16564f50bfbbbfcb58",
"assets/assets/fonts/overpass_regular.otf": "71096f93ab59ad7c66a963700c422f54"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
