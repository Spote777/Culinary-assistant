//
//  NetworkService.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func login(email: String, password: String, completion: @escaping(Result<TokenResponse?, AFError>) -> Void)
    func registration(username: String, email: String, password: String, firstName: String, lastName: String, completion: @escaping(Result<RegistrationResponse?, AFError>) -> Void)
    func logout(completion: @escaping(Result<EmptyResponse?, AFError>) -> Void)
    func changePassword(newPassword: String, currentPassword: String, completion: @escaping(Result<EmptyResponse, AFError>) -> Void)
    func userProfile(id: String, completion: @escaping(Result<UserProfileResponse, AFError>) -> Void)
    func myProfile(completion: @escaping(Result<UserProfileResponse, AFError>) -> Void)
    func tagsList(completion: @escaping(Result<TagsResponse, AFError>) -> Void)
    func tagList(id: String, completion: @escaping(Result<TagsResponseElement, AFError>) -> Void)
    func recipesList(completion: @escaping(Result<FoodsModel?, AFError>) -> Void)
    func recipedByID(id: String, completion: @escaping(Result<FoodModel? ,AFError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    @discardableResult
    private func performRequest<T:Decodable>(route: APIRouter,
                                                    decoder: JSONDecoder = JSONDecoder(),
                                                    completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder) { (response: DataResponse<T, AFError>) in
                DispatchQueue.main.async {
                    completion(response.result)
                }
            }
    }
    
    func login(email: String,
                      password: String,
                      completion: @escaping(Result<TokenResponse?,
                                            AFError>) -> Void) {
        let jsonDecoder = JSONDecoder()
        performRequest(route: APIRouter.login(email: email,
                                              password: password),
                       decoder: jsonDecoder,
                       completion: completion)
    }
    
    func registration(username: String,
                             email: String,
                             password: String,
                             firstName: String,
                             lastName: String,
                             completion: @escaping(Result<RegistrationResponse?,
                                                   AFError>) -> Void) {
        let jsonDecoder = JSONDecoder()
        performRequest(route: APIRouter.registration(email: email,
                                                     username: username,
                                                     firstName: firstName,
                                                     lastName: lastName,
                                                     password: password),
                       decoder: jsonDecoder,
                       completion: completion)
    }
    
    func logout(completion: @escaping(Result<EmptyResponse?,
                                             AFError>) -> Void) {
        performRequest(route: APIRouter.logout,
                       completion: completion)
    }
    
    func changePassword(newPassword: String,
                               currentPassword: String,
                               completion: @escaping(Result<EmptyResponse,
                                                     AFError>) -> Void) {
        performRequest(route: APIRouter.changePassword(newPassword: newPassword,
                                                       currentPassword: currentPassword),
                       completion: completion)
    }
    
    func userProfile(id: String, completion: @escaping(Result<UserProfileResponse,
                                                              AFError>) -> Void) {
        performRequest(route: APIRouter.userProfile(id: id),
                       completion: completion)
    }
    
    func myProfile(completion: @escaping(Result<UserProfileResponse,
                                                AFError>) -> Void) {
        performRequest(route: APIRouter.myProfile,
                       completion: completion)
    }
    
    func tagsList(completion: @escaping(Result<TagsResponse,
                                               AFError>) -> Void) {
        performRequest(route: APIRouter.tagsList,
                       completion: completion)
    }
    
    func tagList(id: String, completion: @escaping(Result<TagsResponseElement,
                                                          AFError>) -> Void) {
        performRequest(route: APIRouter.tagList(id: id),
                       completion: completion)
    }
    
    func recipesList(completion: @escaping(Result<FoodsModel?,
                                                  AFError>) -> Void) {
        performRequest(route: APIRouter.recipesList,
                       completion: completion)
    }
    
    func recipedByID(id: String, completion: @escaping (Result<FoodModel?,
                                                        AFError>) -> Void) {
        performRequest(route: APIRouter.recipedByID(id: id),
                       completion: completion)
    }
    //
    //    static func userData(completion: @escaping(Result<UserDataRequest,
    //                                               AFError>) -> Void) {
    //        performRequest(route: APIRouter.userData,
    //                       completion: completion)
    //    }
    //
    //    static func getUserMedia(id: String,
    //                             completion: @escaping(Result<UserMediaRequest,
    //                                                   AFError>) -> Void) {
    //        performRequest(route: APIRouter.userMedia(id: id),
    //                       completion: completion)
    //    }
    //
    //    static func getUserSavedMedia(completion: @escaping(Result<UserMediaRequest?, AFError>) -> Void) {
    //        performRequest(route: APIRouter.userSavedMedia,
    //                       completion: completion)
    //    }
    //
    //    static func getLikePhoto(id: String,
    //                             completion: @escaping(Result<LikePhotoModel?, AFError>) -> Void) {
    //        performRequest(route: APIRouter.likePhoto(idPost: id),
    //                       completion: completion)
    //    }
    //
    //    static func getDislikePhoto(id: String,
    //                                completion: @escaping(Result<LikePhotoModel?, AFError>) -> Void) {
    //        performRequest(route: APIRouter.dislikePhoto(idPost: id),
    //                       completion: completion)
    //    }
    //
    //    static func getComments(id: String,
    //                            completion: @escaping(Result<CommentsRequest?, AFError>) -> Void) {
    //        performRequest(route: APIRouter.comments(idPost: id),
    //                       completion: completion)
    //    }
    //
    //    static func changePassword(newPassword: String,
    //                               oldPassword: String,
    //                               completion: @escaping(Result<ChangePasswordRequest?,
    //                                                     AFError>) -> Void) {
    //        performRequest(route: APIRouter.changePassword(oldPassword: oldPassword,
    //                                                       newPassword: newPassword),
    //                       completion: completion)
    //    }
    //
    //    static func getNotificationFriends(follow: String,
    //                                       like: String,
    //                                       comment: String,
    //                                       completion: @escaping(Result<FeedRequest?,
    //                                                             AFError>) -> Void) {
    //        performRequest(route: APIRouter.notificationFriends(like: like,
    //                                                            follow: follow,
    //                                                            comment: comment),
    //                       completion: completion)
    //    }
    //
    //    static func getSinglePhoto(idPost: String,
    //                               completion: @escaping(Result<UserMediaElement?,
    //                                                     AFError>) -> Void) {
    //        performRequest(route: APIRouter.singlePhoto(idPost: idPost),
    //                       completion: completion)
    //    }
    //
    //    static func changeUserData(userId: String,
    //                               firstName: String?,
    //                               lastName: String?,
    //                               username: String?,
    //                               description: String?,
    //                               email: String,
    //                               link: [[String: String]],
    //                               completion: @escaping(Result<UserDataRequest,
    //                                                     AFError>) -> Void) {
    //        performRequest(route: APIRouter.changeUserData(userId: userId,
    //                                                       name: firstName ?? "",
    //                                                       lastname: lastName ?? "",
    //                                                       email: email,
    //                                                       username: username ?? "",
    //                                                       description: description ?? "",
    //                                                       link: link),
    //                       completion: completion)
    //    }
    //
    //    static func deleteUserPhoto(id: String,
    //                                completion: @escaping(Result<DefRequest,
    //                                                      AFError>) -> Void) {
    //        performRequest(route: APIRouter.deleteUserPhoto(id: id),
    //                       completion: completion)
    //    }
    //
    //    static func otherUserProfile(id: String,
    //                                 completion: @escaping(Result<UserDataRequest,
    //                                                       AFError>) -> Void) {
    //        performRequest(route: APIRouter.otherUserProfile(id: id),
    //                       completion: completion)
    //    }
    //
    //    static func getComplaintsPostType(completion: @escaping(Result<ComplaintsRequest,
    //                                                        AFError>) -> Void) {
    //        performRequest(route: APIRouter.complaintsPostTypes,
    //                       completion: completion)
    //    }
    //
    //    static func getComplaintsUserType(completion: @escaping(Result<ComplaintsRequest,
    //                                                        AFError>) -> Void) {
    //        performRequest(route: APIRouter.complaintsUserTypes,
    //                       completion: completion)
    //    }
    //
    //    static func sendPostComplaints(text: String,
    //                               postID: String,
    //                               complaintType: String,
    //                               completion: @escaping(Result<PostComplaintsRequest,
    //                                                     AFError>) -> Void) {
    //        performRequest(route: APIRouter.sendPostComplaints(type: complaintType,
    //                                                       description: text,
    //                                                       postID: postID),
    //                       completion: completion)
    //    }
    //
    //    static func sendUserComplaints(text: String,
    //                               postID: String,
    //                               complaintType: String,
    //                               completion: @escaping(Result<UserComplaintsRequest,
    //                                                     AFError>) -> Void) {
    //        performRequest(route: APIRouter.sendUserComplaints(type: complaintType,
    //                                                       description: text,
    //                                                       userID: postID),
    //                       completion: completion)
    //    }
    //
    //    static func notInterestedPost(postID: String,
    //                                  completion: @escaping(Result<DefRequest,
    //                                                        AFError>) -> Void) {
    //        performRequest(route: APIRouter.notInterestedPost(postID: postID),
    //                       completion: completion)
    //    }
    //
    //    static func getBlackList(completion: @escaping(Result<BlackListRequest,
    //                                                    AFError>) -> Void) {
    //        performRequest(route: APIRouter.blackList,
    //                       completion: completion)
    //    }
    //
    //    static func goToBlackList(userID: String,
    //                              completion: @escaping(Result<DefRequest,
    //                                                    AFError>) -> Void) {
    //        performRequest(route: APIRouter.goToBlackList(userID: userID),
    //                       completion: completion)
    //    }
    //
    //    static func goToWhiteList(userID: String,
    //                              completion: @escaping(Result<DefRequest,
    //                                                    AFError>) -> Void) {
    //        performRequest(route: APIRouter.goToWhiteList(userID: userID),
    //                       completion: completion)
    //    }
    //
    //    static func subscribeUser(userID: String,
    //                              completion: @escaping(Result<SubscribeRequest,
    //                                                    AFError>) -> Void) {
    //        performRequest(route: APIRouter.subscribe(userID: userID),
    //                       completion: completion)
    //    }
    //
    //    static func unsubscribeUser(userID: String,
    //                              completion: @escaping(Result<DefRequest,
    //                                                    AFError>) -> Void) {
    //        performRequest(route: APIRouter.unsubscribe(userID: userID),
    //                       completion: completion)
    //    }
    //
    //    static func getMyFriendsPosts(completion: @escaping(Result<UserMediaRequest?,
    //                                                      AFError>) -> Void) {
    //        performRequest(route: APIRouter.myFriendsPosts,
    //                       completion: completion)
    //    }
    //
    //    static func uploadPhoto(type: Data,
    //                            image: Data?,
    //                            videoData: URL?,
    //                            preview: Data?,
    //                            tag: String?,
    //                            description: String?,
    //                            completion: @escaping(UserMediaElement,
    //                                                  AFError?) -> ()) {
    //        guard let baseUrl = URL(string: NetworkConstants.ProductionServer.baseURL + "/posts/") else {return}
    //        let header: HTTPHeaders = ["Authorization": "Token \(Session.instance.token ?? "")"]
    //        AF.upload(
    //            multipartFormData: { multipartFormData in
    //                multipartFormData.append(type, withName: "post_type")
    //                if image != nil {
    //                    multipartFormData.append(image!, withName: "docfile", fileName: "docfile.jpeg", mimeType: "image/jpeg")
    //                    multipartFormData.append(tag?.data(using: .utf8) ?? Data(), withName: "string_tags")
    //                    multipartFormData.append(description?.data(using: .utf8) ?? Data(), withName: "text")
    //                }
    //                if videoData != nil {
    //                    multipartFormData.append(videoData!, withName: "docfile", fileName: "video.mp4", mimeType: "video/mp4")
    //                    multipartFormData.append(preview!, withName: "preview", fileName: "preview.jpeg", mimeType: "image/jpeg")
    //                }
    //            }, to: baseUrl, method: .post, headers: header).response { (response) in
    //                switch response.result {
    //                case .success:
    //                    guard let data = response.data else {return}
    //                    guard let item = try? JSONDecoder().decode(UserMediaElement.self, from: data) else {
    //                        print("Empty Data something wrong")
    //                        return
    //                    }
    //                    DispatchQueue.main.async {
    //                        completion(item, nil)
    //                    }
    //                case .failure(let error):
    //                    print(error)
    //                }
    //            }
    //    }
}
