<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.13.6/dist/full.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="min-h-full">
        <nav class="bg-gray-800">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
              <div class="flex items-center">
                <div class="flex-shrink-0">
                  <img class="h-8 w-8" src="https://skr.sh/i/140522/56bcwtEJ.jpg?download=1&name=Скриншот%2014-05-2022%2009:50:04.jpg" alt="Nova">
                </div>
                <div class="hidden md:block">
                  <div class="ml-10 flex items-baseline space-x-4">
                    <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                    <a href="/log" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">History</a>
      
                    <a href="/action" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Action</a>
            
                    <a href="/users" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium">Users</a>
            
                    <a href="/registration" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Registration</a>
            
                    <a href="/in" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">People in the building</a>
                  </div>
                </div>
              </div>
              <div class="hidden md:block">
                <div class="ml-4 flex items-center md:ml-6">
                  <button type="button" class="bg-gray-800 p-1 rounded-full text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white">
                    <span class="sr-only">View notifications</span>
                    <!-- Heroicon name: outline/bell -->
                    <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                    </svg>
                  </button>
                  </div>
                </div>
              </div>
              <div class="-mr-2 flex md:hidden">
                <!-- Mobile menu button -->
              </div>
            </div>
          </div>
      
          <!-- Mobile menu, show/hide based on menu state. -->
          <div class="md:hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
              <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
              <a href="/log" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">History</a>
      
              <a href="/action" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Action</a>
      
              <a href="/users" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium">Users</a>
      
              <a href="/registration" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Registration</a>
      
              <a href="/in" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">People in the building</a>
            </div>
            </div>
          </div>
        </nav>
      
        <header class="bg-white shadow">
          <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
            <h1 class="text-3xl font-bold text-gray-900">User</h1>
          </div>
        </header>
        <main>
          <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <!-- Replace with your content -->
            <div class="px-4 py-6 sm:px-0">
              <div class="rounded-lg h-96">
                <table class="table-auto border-separate border border-slate-500 ...">
                  <thead>
                    <tr>
                      <th class="w-1/12 border border-slate-600 ...">№</th>
                      <th class="w-3/12 border border-slate-600 ...">Userid</th>
                      <th class="w-6/12 border border-slate-600 ...">Full name</th>
                      <th class="w-1/12 border border-slate-600 ...">Direction</th>
                      <th class="w-2/12 border border-slate-600 ...">Groups</th>
                      <th class="w-screen border border-slate-600 ...">School Number</th>
                    </tr>
                  </thead>  
                  <tbody>
                    %for index, i in enumerate(us):
                        <tr>
                          <td class="border border-slate-700 ...">{{index + 1}}</td>
                          <td class="border border-slate-700 ...">{{i[0]}}</td>
                          <td class="border border-slate-700 ...">{{i[1]}}</td>
                          <td class="border border-slate-700 ...">{{i[2]}}</td>
                          <td class="border border-slate-700 ...">{{i[3]}}</td>
                          <td class="border border-slate-700 ...">{{i[4]}}</td>
                        </tr>  

                    %end
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /End replace -->
          </div>
        </main>
      </div>
</body>
</html>