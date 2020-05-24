import resolve from './main'

test('case1', () =>{
  expect(resolve("100 100 100")).toBe("Yes")
})