// Copyright 2014 the V8 project authors. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of Google Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// 08_splay-latency.js
// 12_mandreel-latency.js

var base_dir = '';
load(base_dir + 'base.js');
load(base_dir + '01_richards.js');
load(base_dir + '02_deltablue.js');
load(base_dir + '03_crypto.js');
load(base_dir + '04_raytrace.js');
load(base_dir + '05_earley-boyer.js');
load(base_dir + '06_regexp.js');
load(base_dir + '07_splay.js');
load(base_dir + '09_navier-stokes.js');
load(base_dir + '10_pdfjs.js');
load(base_dir + '11_mandreel.js');
load(base_dir + '13_gbemu-part1.js');
load(base_dir + '13_gbemu-part2.js');
load(base_dir + '14_code-load.js');
load(base_dir + '15_box2d.js');
load(base_dir + '16_zlib.js');
load(base_dir + '16_zlib-data.js');
load(base_dir + '17_typescript.js');
load(base_dir + '17_typescript-input.js');
load(base_dir + '17_typescript-compiler.js');

var success = true;

function PrintResult(name, result) {
  print(name + ': ' + result);
}


function PrintError(name, error) {
  PrintResult(name, error);
  success = false;
}


function PrintScore(score) {
  if (success) {
    print('----');
    print('Score (version ' + BenchmarkSuite.version + '): ' + score);
  }
}


BenchmarkSuite.config.doWarmup = undefined;
BenchmarkSuite.config.doDeterministic = undefined;

BenchmarkSuite.RunSuites({ NotifyResult: PrintResult,
                           NotifyError: PrintError,
                           NotifyScore: PrintScore });
