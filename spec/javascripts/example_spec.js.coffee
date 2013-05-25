# use require to load any .js file available to the asset pipeline
# require foo
# require bar

describe "Foo", ->
  loadFixtures 'example_fixture' # located at 'spec/javascripts/fixtures/example_fixture.html.haml'
  it "it is working", ->
    expect(false).toEqual(false)

describe "Bar", ->
  it "it can compare foo strings", ->
    expect("foo").toEqual("foo")
