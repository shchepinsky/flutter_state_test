import 'dart:async';
import 'dart:isolate';

class _SpawnConfig {
  final Function task;
  final SendPort sendPort;
  final Map params;

  _SpawnConfig(this.task, this.sendPort, this.params);

  apply () async {
    final result = task(this.params);

    return result is Future
      ? await result
      : result;
  }
}

_spawn (_SpawnConfig spawnConfig) async {
  final result = await spawnConfig.apply();
  spawnConfig.sendPort.send(result);
}

computeAsync(task, {Map params}) async {
  ReceivePort receivePort = ReceivePort();

  final spawnConfig = _SpawnConfig(task, receivePort.sendPort, params);

  Isolate.spawn(_spawn, spawnConfig);

  return receivePort.first;
}