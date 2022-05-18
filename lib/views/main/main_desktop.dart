part of main_view;

class _MainDesktop extends StatelessWidget {
  final MainViewModel viewModel;

  _MainDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desktop'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: viewModel.increment,
        backgroundColor: Colors.amber,
      ),
    );
  }
}