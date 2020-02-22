class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
    @badges = Badge.all
  end

  def call
    @badges.select do |badge|
      send("#{badge.rule}?", badge)
    end
  end

  private

  def by_category?(badge)
    return unless @test_passage.success? && @test.category_id == badge.value.to_i
    #Category.where(title: badge.value).ids.first #@test.category.title == badge.value
   
    user_badge = UserBadge.assigned_badges(@user, badge).last
    @test_passages = @test_passages.where(created_at: user_badge.created_at..Time.current) if user_badge
    category_tests = Test.by_category(badge.value.to_i)
    passed_tests = @test_passages.success_passed.joins(:test).where("tests.category_id": @test.category_id)
    category_tests.pluck(:id).sort == passed_tests.pluck(:test_id).uniq.sort
  end

  def by_level?(badge)
    return unless @test_passage.success?  && @test.level == badge.value.to_i
   
    user_badge = UserBadge.assigned_badges(@user, badge).last
    @test_passages = @test_passages.where(created_at: user_badge.created_at..Time.current) if user_badge
    level_tests = Test.by_level(@test.level)
    passed_tests = @test_passages.success_passed.joins(:test).where("tests.level": @test.level)
    level_tests.pluck(:id).sort == passed_tests.pluck(:test_id).uniq.sort
  end

  def first_attempt?(badge)
    return unless @test_passage.success?
    @user.tests.where(id: @test.id).count == 1
  end
end
