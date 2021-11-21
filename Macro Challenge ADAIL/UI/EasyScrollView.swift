//
//  EasyScrollView.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import UIKit

final class EasyScrollView: UIScrollView {
    // https://medium.com/swift-productions/create-a-uiscrollview-programmatically-xcode-12-swift-5-3-f799b8280e30
    private var scrollView: UIScrollView { self }
    private let contentView = UIView()
    let stack = UIStackView()
    
    struct LayoutSetting {
        var widthMultiplier: CGFloat = 1
        var top: CGFloat = 1
        var bottom: CGFloat = 1
    }
    
    var layoutSetting = LayoutSetting() {
        didSet {
            stack.removeFromSuperview()
            setupStack()
        }
    }
    
    override init(frame: CGRect  = .zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        setupStack()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
    }
    
    func setupScrollView(in view: UIView) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.centerXAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            .isActive = true
        scrollView.widthAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
            .isActive = true
        scrollView.topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        scrollView.bottomAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
        contentView.centerXAnchor
            .constraint(equalTo: scrollView.centerXAnchor)
            .isActive = true
        contentView.widthAnchor
            .constraint(equalTo: scrollView.widthAnchor)
            .isActive = true
        contentView.heightAnchor
            .constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
            .isActive = true
        contentView.topAnchor
            .constraint(equalTo: scrollView.topAnchor)
            .isActive = true
        contentView.bottomAnchor
            .constraint(equalTo: scrollView.bottomAnchor)
            .isActive = true
    }
    
    private func setupStack() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        stack.topAnchor
            .constraint(equalTo: contentView.topAnchor,
                        constant: layoutSetting.top)
            .isActive = true
        stack.centerXAnchor
            .constraint(equalTo: contentView.centerXAnchor)
            .isActive = true
        stack.bottomAnchor
            .constraint(equalTo: contentView.bottomAnchor,
                        constant: layoutSetting.bottom)
            .isActive = true
        stack.widthAnchor
            .constraint(equalTo: contentView.widthAnchor,
                        multiplier: layoutSetting.widthMultiplier)
            .isActive = true
    }
}

#if DEBUG
import SwiftUI

struct EasyScrollView_Preview: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        _View().preview()
    }
    
    final class _View: UIView {
        
        let nameTitleLabel: UILabel = {
            let label = UILabel()
            label.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam finibus in dui nec eleifend. Integer imperdiet, lacus sed tincidunt ultrices, dui odio dignissim elit, id facilisis lorem lectus in dui. Phasellus dignissim ante eget nisi maximus malesuada. Morbi dui metus, elementum id nibh ac, egestas sollicitudin ante. Maecenas tempus quam arcu, sed tristique sem fermentum ac. Suspendisse vel nibh consectetur, efficitur elit sit amet, mattis nulla. Duis nec porta lectus. Vivamus vulputate libero eu sem ultrices, eu volutpat justo iaculis.

            Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget leo dictum, rutrum erat molestie, cursus felis. Vestibulum vel egestas mauris. In egestas rutrum diam. Fusce blandit libero enim, sed elementum purus venenatis vitae. Maecenas dictum, quam vitae laoreet ultrices, turpis mauris laoreet lacus, eget dapibus odio dolor sit amet mi. Integer purus ante, tristique quis purus ac, iaculis venenatis elit. Quisque mauris est, pharetra at tellus eget, viverra vestibulum enim. Vestibulum quam dolor, aliquet vitae sapien a, fringilla suscipit dolor. Phasellus eget ligula mauris. Mauris nec malesuada mi. Integer efficitur id odio tempus imperdiet. Aliquam vehicula finibus accumsan. Quisque pulvinar tincidunt orci, in hendrerit augue consequat in. Quisque bibendum placerat erat ut mattis.

            Fusce pretium sapien eget dolor interdum, ut tincidunt justo tempor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec malesuada ultrices egestas. Nunc luctus scelerisque tellus, id rhoncus urna vehicula ut. Etiam auctor vel nisl quis vulputate. Donec luctus facilisis sapien sit amet eleifend. Morbi suscipit justo ut tellus sollicitudin lacinia. Integer tellus urna, congue vel ante at, eleifend sagittis lacus. Quisque sit amet lectus tortor. Donec ornare tincidunt sollicitudin. Integer sapien massa, fringilla et tempus sit amet, fringilla eu urna. Ut elementum viverra egestas. Proin tincidunt a lectus vel blandit. Sed vel leo ut tortor suscipit pretium. Duis vehicula nibh purus, eu suscipit mauris sollicitudin non. Curabitur malesuada, urna ac luctus rutrum, ex massa scelerisque augue, ut scelerisque velit nisi quis ligula.

            Donec sit amet volutpat ex, vitae sollicitudin ipsum. Sed ac sapien a nulla convallis pulvinar. Donec eu ante sit amet risus venenatis vulputate a et est. Suspendisse consectetur, mi id sagittis aliquet, felis turpis aliquam dui, et accumsan ex libero vitae lacus. Cras porttitor mi id cursus interdum. Praesent mauris ex, porta quis dolor eget, luctus imperdiet tellus. Ut mollis elementum mauris, id fermentum velit. Duis tempor nibh nunc, eget tempus leo commodo in. Ut at felis eget nisl euismod ultricies sed sed enim. Sed in scelerisque quam, vel placerat velit. Suspendisse quis dolor condimentum, mattis lectus non, consequat diam.

            Quisque tincidunt ultrices tellus, ut sodales mi rhoncus sit amet. Nam mollis non magna vel dapibus. Donec bibendum, arcu vitae porta tincidunt, felis ante egestas elit, eget lobortis neque diam non erat. Duis malesuada eget nisl vitae pretium. Donec libero mauris, posuere sit amet auctor ut, blandit sed sapien. Aliquam ligula lacus, consequat quis maximus eget, pretium et sapien. Donec rhoncus justo pellentesque, suscipit lectus quis, hendrerit tortor. Fusce ac hendrerit tortor. Sed dapibus et purus nec maximus. Nullam bibendum fringilla tellus, sed elementum quam mollis vel.
            """
            label.numberOfLines = 0
            label.sizeToFit()
            label.textColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
            label.numberOfLines = 0
            label.sizeToFit()
            label.textColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override func layoutSubviews() {
            super.layoutSubviews()
            let scrollView = EasyScrollView()
            scrollView.setupScrollView(in: self)
            scrollView.stack.distribution = .equalCentering
            scrollView.stack.alignment = .center
            scrollView.layoutSetting.widthMultiplier = 0.6
            scrollView.stack.addArrangedSubview(nameTitleLabel)
            scrollView.stack.addArrangedSubview(subtitleLabel)
        }
    }
}

#endif

