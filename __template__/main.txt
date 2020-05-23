import * as fs from "fs"

const resolve = (stdin: string):string => {
  const line:string[] = stdin.split("\n")
  const input = line[0].split(" ")
  
  const a = +input[0]
  const b = +input[1]
  const c = +input[2]
  
  if(c >= a && c <= b) {
    return "Yes"
  } else {
    return "No"
  }
}

if (!process.env.LOCAL_DEBUG) {
  const stdin:string = fs.readFileSync("/dev/stdin", "utf8") as string
  console.log(resolve(stdin))
}

// -- Copy the above from here.

export default resolve