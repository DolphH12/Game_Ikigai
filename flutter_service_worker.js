'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b79e46c5e79d9290d048b4019dadbf5f",
"version.json": "4227bac0a9029144acfebb92b7f107ca",
"index.html": "d8085036b390ce5ff354d189e5f3ec42",
"/": "d8085036b390ce5ff354d189e5f3ec42",
"main.dart.js": "289f909419ddfc4ffb67d3f11e72ee24",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e0e55ced871da9b2081cfddd428939f1",
"assets/AssetManifest.json": "5303df2fbbfb5164618e02510e0d7cd6",
"assets/NOTICES": "c1c591d9df8bd2b0a9e19bd0648cdb2a",
"assets/FontManifest.json": "10e3a6329f5b49029fe15b924989a159",
"assets/AssetManifest.bin.json": "1610af752cd4924f0592be431532053c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "d33db6bf83685d4380524db4963ab107",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/info.png": "87c547347e9dd82d1fbbfbe7bf0e8615",
"assets/assets/images/rabbit.png": "2b32c870207433e22de6e397090837b2",
"assets/assets/images/fondoikigai.png": "f08c0b1796afc0b42e7b60aae93f77d7",
"assets/assets/images/map.png": "02953b59392f7873725e661da9717427",
"assets/assets/images/star.png": "27e7f644a34c7e56795ae34d0d471344",
"assets/assets/images/player.png": "743d85f3000ac4c4ecf490c7784cf4fc",
"assets/assets/tiles_set/Basic_Grass_Biom_things.png": "aed9324ef39151b6813e2a4532362b92",
"assets/assets/tiles_set/Hills.png": "e32e31952a4b7270e707bda621c0155c",
"assets/assets/tiles_set/Grass.png": "0d797851a7171a2014aea20d78d0d4d1",
"assets/assets/tiles_set/Water.png": "78d1ad08e28c734e437b35e58f200560",
"assets/assets/tiles/mapa_taller.tiled-session": "37b80d5786b710e230bc616154ed8e01",
"assets/assets/tiles/hills.tsx": "5036dd375686628b70d13f0a51c869cb",
"assets/assets/tiles/mapa_taller.tiled-project": "97165873765b29a5041f09e541be15d5",
"assets/assets/tiles/water.tsx": "df1c03e835a24539036dc457449a8531",
"assets/assets/tiles/grass.tsx": "ccf10d8278ab1959ebc4ca48f586d6b8",
"assets/assets/tiles/Level-Final.tmx": "91ba8208a4113a2665f782e85de86aad",
"assets/assets/tiles/Level-04.tmx": "a9facd0fc12a19fcf4757edc763656ee",
"assets/assets/tiles/Level-05.tmx": "bde58d44ecaccce0364a40c0a68d4206",
"assets/assets/tiles/Level-02.tmx": "cb72d8a02d3051fd7155ce6660de9fcc",
"assets/assets/tiles/Level-03.tmx": "ddcf9fb4f52049b1348fb2b62d64db19",
"assets/assets/tiles/Level-01.tmx": "3c5d66f527e3de6b5b971ec34195cd2f",
"assets/assets/tiles/object_grass.tsx": "f1ef9c1a7bdac12646c616c36989b676",
"assets/assets/fonts/PixelifySans-Regular.ttf": "d6b4fe0a9425d5e9b459d654109498b4",
"assets/assets/evidences/Personajes.png": "c299f69bb072a9dcb12eac9563b689de",
"assets/assets/evidences/sm.gif": "577839bd10e5bf0c3844302d0cf8b6ef",
"assets/assets/evidences/dkew.gif": "c2d28a553fec8e188bf2c09967c6776f",
"assets/assets/evidences/delete_user.gif": "55913a843ccfc1794fe81552e43d6fe1",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
