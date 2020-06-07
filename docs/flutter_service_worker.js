'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2bcff8d1b8a9e2264b62566129a0c810",
"assets/assets/floor.jpg": "d32958d35f1a853bf34258ce731a8dc7",
"assets/assets/github_logo.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/gmail.png": "293619036aaf6436584c5238f175b8c8",
"assets/assets/instagram.png": "4a8c23476a7c20c5bee2a752a6f96e9e",
"assets/assets/my_pic.png": "e33544bf4d30d011f88ea473152695a1",
"assets/assets/twitter.png": "8f35a40403a84631c4125c4f1859c7a6",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "5b0ba88f19d1cb8ea81a6d5cb1edc0c9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "6cd2038528b9fe3aecb217aba0fb1582",
"/": "6cd2038528b9fe3aecb217aba0fb1582",
"main.dart.js": "80b0dc7641f968eca1b20e6b9674dcae",
"manifest.json": "d0a4b93f29484fa1e8c2228adde4299f"
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
