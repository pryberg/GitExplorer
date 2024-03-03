import Foundation

struct Root: Codable {

  var totalCount        : Int?     = nil
  var items             : [Repository]? = []

  enum CodingKeys: String, CodingKey {

    case totalCount        = "total_count"
    case items             = "items"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    totalCount        = try values.decodeIfPresent(Int.self     , forKey: .totalCount        )
    items             = try values.decodeIfPresent([Repository].self , forKey: .items             )
 
  }

  init() {

  }

}
