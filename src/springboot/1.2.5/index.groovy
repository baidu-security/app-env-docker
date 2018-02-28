@RestController
class ThisWillActuallyRun {
  @RequestMapping("/")
  String home(String id) {
    int a = id
  }
}