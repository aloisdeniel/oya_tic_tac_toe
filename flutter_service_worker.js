'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "4c4af4d12543598fa79ba39c0477e7a4",
"main.dart.mjs": "6c6efb59abbc780267f4da5468c72b57",
"drift_worker.dart.js": "2746fca667d5b06ed4117cf869e47a32",
"index.html": "3e688daf34f24e46a0d11aeb8e3c4917",
"/": "3e688daf34f24e46a0d11aeb8e3c4917",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/glitch.frag": "48a45edd50ef6fe9947bdad976f2d33b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "dff9c112873a76fa05c6cd67614b4a9a",
"assets/assets/avatar/heart.png": "a8fe4fbba35dd09d9a7921204003123c",
"assets/assets/avatar/1.5x/heart.png": "82320f37ccdc58f35793ae009f2b5510",
"assets/assets/avatar/1.5x/clover.png": "a206a612dbe59b66f57617f15c6fdf64",
"assets/assets/avatar/1.5x/circle.png": "27dfe5c084d795854147bfe60aa57784",
"assets/assets/avatar/1.5x/robot.png": "d04b54cbe4adbbf6506a2bd162276f4f",
"assets/assets/avatar/1.5x/cross.png": "80ddd9acffd6ff98ef91bf35afc028ae",
"assets/assets/avatar/1.5x/diamond.png": "f328c2e02fea09891d152da5031ce89b",
"assets/assets/avatar/1.5x/spade.png": "5f9119530625d45acb57f2c81225cb28",
"assets/assets/avatar/clover.png": "e0b1765bab4c7a01161fdbbb46152ecb",
"assets/assets/avatar/circle.png": "8ebb24c1975297509245eca64138cefa",
"assets/assets/avatar/robot.png": "fddceaeeba5bcf20dca8b82ba49f8815",
"assets/assets/avatar/2.0x/heart.png": "8973ad544928da0820221748983fb976",
"assets/assets/avatar/2.0x/clover.png": "c27d2700d4fdd27faf7a94085b7e20b8",
"assets/assets/avatar/2.0x/circle.png": "5f634f254cca084c9160d155f6eabf73",
"assets/assets/avatar/2.0x/robot.png": "ba6185ee0e9738acb7d4a2e185dd5e2c",
"assets/assets/avatar/2.0x/cross.png": "2e9b2db72f1d0fae18dbcb2264afc23c",
"assets/assets/avatar/2.0x/diamond.png": "97ba081be78d4a6525c91e39ba1c09dd",
"assets/assets/avatar/2.0x/spade.png": "d1078c5a824046d3e1f2dd32a1f85ea5",
"assets/assets/avatar/cross.png": "5b82dcfa41cec5517d211e43ff2b7621",
"assets/assets/avatar/diamond.png": "7309c8cbaf0b54d3893acd18803c5732",
"assets/assets/avatar/spade.png": "dffe65bd51c2140a2a3ac28343a8fdcb",
"assets/assets/character/heart.png": "ca61f6c4cfc5a22d093654dc7fc65112",
"assets/assets/character/1.5x/heart.png": "9ec7f37fa0b29817f49e7bb8cefc87d7",
"assets/assets/character/1.5x/clover.png": "b98f34c4ad51a1a1737154303446faa3",
"assets/assets/character/1.5x/circle.png": "1e4e5e70015449bf2ad379f56052b39a",
"assets/assets/character/1.5x/robot.png": "62f763e3ed59709a7dc6a81a56c9e953",
"assets/assets/character/1.5x/cross.png": "d03262a125768848e0be31da9383d4c5",
"assets/assets/character/1.5x/diamond.png": "6a93aee38dc4861445d33c0f0591d4f4",
"assets/assets/character/1.5x/spade.png": "cbe7cdffc353df27f7a87d2d1cbc962a",
"assets/assets/character/clover.png": "d798e122c4c37434b07c4fe12f0716b9",
"assets/assets/character/circle.png": "0a8091a9268f823409d8d5b4a6862ec5",
"assets/assets/character/robot.png": "369ee3dc494721c80f5fde296d6704bc",
"assets/assets/character/2.0x/heart.png": "473a643c647c99d3fe0f0cad24774740",
"assets/assets/character/2.0x/clover.png": "a1df3e3717d64fc1016d707fcb9ec0ff",
"assets/assets/character/2.0x/circle.png": "280cc19a082b2292c8c90f4c44fb297b",
"assets/assets/character/2.0x/robot.png": "fd146c8f0bdfd932fd9cfcffd39a4471",
"assets/assets/character/2.0x/cross.png": "2a47fcf55ccf61cfcdd477f02ffb18a3",
"assets/assets/character/2.0x/diamond.png": "30dd2683d180533ad3f52139d40c768d",
"assets/assets/character/2.0x/spade.png": "fdde0db7ae215bcfd38c16e8a071c56a",
"assets/assets/character/cross.png": "7ffc6d98468584bad9b96343a11733be",
"assets/assets/character/diamond.png": "c0c7f1eed4f926dee7e6f7e1d1f95d08",
"assets/assets/character/spade.png": "0ac22ea56bd694df9991250606ac66cf",
"assets/assets/fonts/Lexend-Variable.ttf": "cb01f8c583a94c114539638352278b44",
"assets/assets/fonts/TiltWarp-Variable.ttf": "9f45d043efe96877a4c6fe74721dc197",
"assets/assets/background/elevator.png": "30ea4c141627901f3802d1eb503a5944",
"assets/assets/background/park1.png": "0bbabab38755f197ce4ef0ac952e97d2",
"assets/assets/background/1.5x/elevator.png": "8ae160fd690328b3861eb176496b6053",
"assets/assets/background/1.5x/park1.png": "5e678bd4cc0c343ffadc7bcdef5c0416",
"assets/assets/background/1.5x/screens.png": "bd5524ab09c9cee96377d90ba9abb62f",
"assets/assets/background/1.5x/room.png": "217a84227d2e3528c1f5a842ad015959",
"assets/assets/background/1.5x/room2.png": "bef1641b6cdad311dc36d62f88f93a41",
"assets/assets/background/1.5x/city.png": "81fe6d717ae7c178f556d26efc59ccf9",
"assets/assets/background/1.5x/park2.png": "ae8000cee072b5657dfe2714d559f378",
"assets/assets/background/1.5x/city2.png": "17c3cd2bec33d011501bdbc05b2ce735",
"assets/assets/background/screens.png": "f6a445ccaa472782ed92832308d1784b",
"assets/assets/background/room.png": "47cb2f3b95c43205c8160006a6a0b638",
"assets/assets/background/room2.png": "af53a0cd6cec443f8563d5210bda72f8",
"assets/assets/background/2.0x/elevator.png": "bd494ec7feca7aec0b19df7cf609cdb4",
"assets/assets/background/2.0x/park1.png": "32b0d6b340e1fe4b17946b699bcd373b",
"assets/assets/background/2.0x/screens.png": "2859c5d2d7018375fae85efaad9263e2",
"assets/assets/background/2.0x/room.png": "c2cb11766b4da7068e0570a622ade5c8",
"assets/assets/background/2.0x/room2.png": "a63ebc52b103e9cf507d4c91a991982c",
"assets/assets/background/2.0x/city.png": "989ea1cb37f6d137abf16cfbf824b017",
"assets/assets/background/2.0x/park2.png": "351bc18b10b5d965eab2d25ec1e32134",
"assets/assets/background/2.0x/city2.png": "2d312e58956e70bb915d999d85bc9ad1",
"assets/assets/background/city.png": "557c655d2239f74348366143cb38f322",
"assets/assets/background/park2.png": "0b37565bc5f075ed1c661b190f66fd95",
"assets/assets/background/city2.png": "30a86b6dba5d495b4348b3882f7cebd0",
"assets/assets/background/vertical/elevator.png": "a975de5e3545c71089307e7fd03f6ad4",
"assets/assets/background/vertical/park1.png": "6777d1f5af7f8aca1c01e4b5bc3cb598",
"assets/assets/background/vertical/1.5x/elevator.png": "dc44aebad98e418d6f08ce84a5d6cc44",
"assets/assets/background/vertical/1.5x/park1.png": "e924b85d7d7d7c8db83bcf9624e80e94",
"assets/assets/background/vertical/1.5x/screens.png": "03861454ca5503a2ecad491146a32254",
"assets/assets/background/vertical/1.5x/room.png": "39d2d4648c03976be49924a3b3f4f79d",
"assets/assets/background/vertical/1.5x/room2.png": "98166cf6c853aaca182e35c4176e3a71",
"assets/assets/background/vertical/1.5x/city.png": "b17b85b95874fb4a31c7443183506bcc",
"assets/assets/background/vertical/1.5x/park2.png": "d5fac049eb61daee08ccfcbd8e13cfff",
"assets/assets/background/vertical/1.5x/city2.png": "b20d615a5825a78db781f28fc3b021e1",
"assets/assets/background/vertical/screens.png": "d768660c884a19686ac51bb1ea723114",
"assets/assets/background/vertical/room.png": "6ee0d9950a5988c85f0489ad4de9ffe2",
"assets/assets/background/vertical/room2.png": "60815de219c25b8263cf953006fade1a",
"assets/assets/background/vertical/2.0x/elevator.png": "10a0c3c34cc771257ad8b9a34072c748",
"assets/assets/background/vertical/2.0x/park1.png": "013abed60476db607ed4290fab5e8933",
"assets/assets/background/vertical/2.0x/screens.png": "1e0371bad04953bc8ba454cfe26bbe5e",
"assets/assets/background/vertical/2.0x/room.png": "b3310693cd8482e137aa1ec59a18700f",
"assets/assets/background/vertical/2.0x/room2.png": "ce81d4df9a0bad7fc40fd43a3052e013",
"assets/assets/background/vertical/2.0x/city.png": "1af4381148468638bb62cc35a87ae865",
"assets/assets/background/vertical/2.0x/park2.png": "29ae1a9e80c646041cba637fb1fcd0bf",
"assets/assets/background/vertical/2.0x/city2.png": "eb0f10955c26b1830d2c1b64cede4717",
"assets/assets/background/vertical/city.png": "3a3964cda12a8f6b336f7926d1e23bc9",
"assets/assets/background/vertical/park2.png": "68ebfda66453914987cefae6421be6b7",
"assets/assets/background/vertical/city2.png": "d20f46a477098b2acb534d10f5654536",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "2df5af900f07ed3a4ebdca3c9d3ae2b8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/FontManifest.json": "0e560499b15f69be468a958980e27386",
"assets/AssetManifest.bin": "8279c72ff45676f4005e0df851c2434e",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.wasm": "09c76b1e86c4ac7689d82374af2845b4",
"sqlite3.wasm": "122e3453c652869dfc07ff2f8eddd064",
"flutter_bootstrap.js": "171e115215018466bf51eb7c62121cca",
"version.json": "f0b3112ed0d08213af71bb42358518f0",
"main.dart.js": "fcd4e8d8dbaac38db342615b8a88b2b4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
