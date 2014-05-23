resources = do ->
  path = "/images/"
  res =
    start_button: "start.png"
    chara: "chara5.png"

  for k, v of res
    res[k] = path + v

  return res
