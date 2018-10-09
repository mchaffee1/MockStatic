# MockStatic
## One way to mock static method calls

### Overview
One of the hardest things about iOS development is (good) testing.  Among many challenges, one standout is the unavoidable 
existence of static methods (formerly known as "global functions") in (1) third-party libraries and (2) worse, Cocoa itself.

Ideally we want to encapsulate static API calls inside a simple, dumb wrapper that doesn't need unit tests at all.
This pattern can be seen in the project's `Wrapper` type.

Once in a great while, it makes sense to put a *small* amount of logic in a wrapper type.  And if there's logic there,
then we need tests.  

More often and almost as importantly, a good e2e or integration test might end with a static call.  In that case, the best 
possible integration test will run all the way out to a mocked static call.

### Setup
0. You already have Xcode installed, right?  :)  This project is currently being maintained with Xcode 9.4.1.
1. Make sure you have bundler installed
2. In the repo root, run `setup.sh`
3. Open `MockStatic.xcworkspace` in Xcode and have fun
The application should absolutely compile and run, but it does exactly nothing.  The code and tests should tell the whole story.

### What's it do?
- `StaticAPI` simulates a library (or Cocoa) class which contains needed static methods
- `Wrapper` is a dumb wrapper type which uses instance methods to call the `StaticAPI` methods.  This pattern enables unit
testing of the types that consume the API, but it still has a hardcoded dependency to the API class.
- `InjectableWrapper.swift` contains a couple of things:
  - `StaticAPIType` is a protocol declaration containing the static methods from `StaticAPI` which we wish to mock.  
  - `StaticAPI` conformance to `StaticAPIType` is declared next.  The conformance block here should always be empty.
  - `InjectableWrapper` has a constructor which receives a type identifier for a `StaticAPIType`-conformant type, 
which is then stored in the instance variable `API`.  This parameter is defaulted to `StaticAPI` so application code doesn't
need to worry about resolving the dependency.
  - `InjectableWrapper` is then extended to add `WrapperType` conformance through the implementation of `getStuff()`
- `ViewControllerTests` shows a unit test of an interaction between an application class and a wrapped API
- `MockStaticAPI` is a mock of an API class containing static methods.  This mock is used in...
- `InjectableWrapperTests` has a unit test of an interaction between a wrapper type and an API class.
- `IntegrationTests` is a super simple demonstration of how we can use this pattern to make integration tests more meaningful.
If the setup went well, tests should run usefully in Xcode.

### Contributing
I'm going to come back to this project a little later and see if anything more framework-y can be done with this basic pattern.

Feedback and suggestions are welcome at mchaffee@thoughtworks.com; or please feel welcome to submit a pull request if you have
an awesome idea.

-- MTC

